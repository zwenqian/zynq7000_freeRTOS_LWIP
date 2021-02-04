/***********************************************************************************
* ��Ȩ����(C)2020, ���ݺ���ͨ�ż��Źɷ����޹�˾.
* ��Ŀ����:    S023
* �ļ�����:    lwipApps.c
* ����ƽ̨:    GCC
* ���뻷��:    GCC������
* ��������:    C
* ��       ��:    ����ǫ
* ����ժҪ:    LWIP�û��ӿ�ģ��
* �������:    2020��11��
************************************************************************************/
/***********************************************************************************
 *                                   ͷ �� ��
 ***********************************************************************************/
/********************************** ��׼ͷ�ļ� ****************************************/
#include "sleep.h"

/******************************* freeRTOS ͷ�ļ� ************************************/
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

/******************************** lwip�� ͷ�ļ� **************************************/
//#include "lwip/opt.h"
#include "lwip/ip_addr.h"
#include "lwip/netif.h"
#include "lwip/tcpip.h"
#include "lwip/inet.h"
#include "lwip/sockets.h"
#include "lwip/udp.h"

/******************************** Xilinx ͷ�ļ� *************************************/
#include "xparameters.h"

/********************************* �Զ���ͷ�ļ� ***************************************/
#include "lwipApps.h"
#include "dmaUser.h"
#include "hub_queue.h"

/***********************************************************************************
 *                                   �� �� ��
 ***********************************************************************************/
#define LWIP_PORT_INIT_IPADDR( addr )   IP4_ADDR(( addr ), 172, 16, 1, 10)
#define LWIP_PORT_INIT_GW( addr )       IP4_ADDR(( addr), 172, 16, 1, 1)
#define LWIP_PORT_INIT_NETMASK( addr )  IP4_ADDR(( addr ), 255, 255, 255, 0)

#define TASK_FREQUENCY_MS			( 1000 / portTICK_PERIOD_MS )
#define LOCAL_PORT 9998
#define REMOTE_PORT 9999

/***********************************************************************************
 *                                   ȫ �� �� ��
 ***********************************************************************************/
/******************************* �� �� ȫ �� �� �� ***************************************/
struct udp_pcb * g_udpPCB = NULL;
struct ip_addr g_remoteIPAddr;
extern u32 g_RX_count;
extern u32 g_TX_count;
extern u32 g_RX_sock_count;

/***********************************************************************************
 *                                   �� �� �� ��
 ***********************************************************************************/
/******************************* �� �� �� �� �� �� ***************************************/
void vStatusCallback( struct netif *pxNetIf );
int udpCommInit();
void udpCommRecvCallback( void *arg, struct udp_pcb *pcb, struct pbuf *p,
	    ip_addr_t *addr, u16_t port );

/******************************* �� �� �� �� �� �� ***************************************/
extern err_t xemacpsif_init( struct netif *netif );
extern void xemacif_input_thread( void *netif );
extern void vRegisterSampleCLICommands( void );
int vInitLwipUDPSocket();
int vInitLwipTCPSocket();

/***********************************************************************************
 *                                 �� �� ԭ ��
 ***********************************************************************************/
/***********************************************************************************
  * �������ƣ�	lwIPAppsInit()��
  * ����˵����	lwIPӦ�ó�ʼ��������
  * ���������	�ޣ�
  * ������� ��	�ޣ�
  * ���ز��� ��	�ޣ�
  * ��        ע��	�ޣ�
************************************************************************************/
void lwIPAppsInit( void *pvArgument )
{
	ip_addr_t xIPAddr, xNetMask, xGateway;
	static struct netif xNetIf;

	( void ) pvArgument;

	/* Set up the network interface. */
	ip_addr_set_zero( &xGateway );
	ip_addr_set_zero( &xIPAddr );
	ip_addr_set_zero( &xNetMask );

	LWIP_PORT_INIT_GW( &xGateway );
	LWIP_PORT_INIT_IPADDR( &xIPAddr );
	LWIP_PORT_INIT_NETMASK(&xNetMask);

	/* Set mac address */
	xNetIf.hwaddr_len = 6;
	xNetIf.hwaddr[ 0 ] = configMAC_ADDR0;
	xNetIf.hwaddr[ 1 ] = configMAC_ADDR1;
	xNetIf.hwaddr[ 2 ] = configMAC_ADDR2;
	xNetIf.hwaddr[ 3 ] = configMAC_ADDR3;
	xNetIf.hwaddr[ 4 ] = configMAC_ADDR4;
	xNetIf.hwaddr[ 5 ] = configMAC_ADDR5;

	netif_set_default( netif_add( &xNetIf, &xIPAddr, &xNetMask, &xGateway,
			( void * ) XPAR_XEMACPS_0_BASEADDR, xemacpsif_init, tcpip_input ) );
	netif_set_status_callback( &xNetIf, vStatusCallback );

	netif_set_up( &xNetIf );

	/* Create the mutex used to ensure mutual exclusive access to the Tx
	buffer. */
//		xTxBufferMutex = xSemaphoreCreateMutex();
//		configASSERT( xTxBufferMutex );

//	udpCommInit();
	sys_thread_new( "lwIP_In", xemacif_input_thread, &xNetIf,
			configMINIMAL_STACK_SIZE, configMAC_INPUT_TASK_PRIORITY );

	/* Create the FreeRTOS defined basic command server.  This demonstrates use
	of the lwIP sockets API. */
//	xTaskCreate( vBasicSocketsTransmitDealTask, "SockRecv",
//			configMINIMAL_STACK_SIZE * 5, NULL, configCLI_TASK_PRIORITY, NULL );
}

/***********************************************************************************
  * �������ƣ�	vStatusCallback()��
  * ����˵����	lwIP����״̬��ʾ�ص�������
  * ���������	�ޣ�
  * ������� ��	�ޣ�
  * ���ز��� ��	�ޣ�
  * ��        ע��	�ޣ�
************************************************************************************/
void vStatusCallback( struct netif *pxNetIf )
{
	char pcMessage[20];
	struct in_addr* pxIPAddress;

	if( netif_is_up( pxNetIf ) != 0 )
	{
		strcpy( pcMessage, "IP=" );
		pxIPAddress = ( struct in_addr* ) &( pxNetIf->ip_addr );
		strcat( pcMessage, inet_ntoa( ( *pxIPAddress ) ) );
		xil_printf( pcMessage );
	}
	else
	{
		xil_printf( "Network is down��\n\r" );
	}
}

/***********************************************************************************
  * �������ƣ�	vTaskSockTransmit()��
  * ����˵����	socket���ݴ��䴦������
  * ���������	�ޣ�
  * ������� ��	�ޣ�
  * ���ز��� ��	�ޣ�
  * ��        ע��	�ޣ�
************************************************************************************/
void vTaskSockTransmit( void *pvParameters )
{
	int nRet;
//	struct sockaddr sClientAddr;
	char recvData[2000];
	char cgReplyData[128];
	fd_set readFds;
	int nSockFd = -1, nMaxFd;

	( void ) pvParameters;
	xil_printf("\n\rvBasicSocketsTransmitDealTask! \n\r");

	nSockFd = vInitLwipUDPSocket();
//	nSockFd = vInitLwipTCPSocket();
	if( nSockFd < 0 )
	{
		xil_printf("\n\r vInit Lwip Socket fail! nSockFd = %d \n\r", nSockFd );
		vTaskDelete( NULL );
	}
//	socklen_t nlen = sizeof( sClientAddr );

	while( 1 )
	{
		FD_ZERO( &readFds );
		FD_SET( nSockFd, &readFds );
		nMaxFd = nSockFd;
		nRet = lwip_select( nMaxFd + 1, &readFds, NULL, NULL, NULL );
		if( -1 == nRet ) continue;
		if( FD_ISSET( nSockFd, &readFds ) )
		{
			nRet = lwip_recvfrom( nSockFd, recvData, 2000, 0, NULL, NULL );
			if( nRet <= 0 ) continue;
			g_RX_sock_count += nRet;
			memcpy( cgReplyData, recvData, 6 );
			cgReplyData[0] = 1;
			cgReplyData[5] = 1;
			lwip_send( nSockFd, cgReplyData, 6, 0 );
//			xil_printf( "recvData %d : ",  nRet); for( int i = 0; i < nRet; i++ ) xil_printf( " %x", recvData[i] ); xil_printf( "\n\r" );
		}
	}

	close( nSockFd );
	vTaskDelete( NULL );
}

/***********************************************************************************
  * �������ƣ�	udpCommInit()��
  * ����˵����	udp��ʼ��������
  * ���������	�ޣ�
  * ������� ��	�ޣ�
  * ���ز��� ��	�ޣ�
  * ��        ע��	�ޣ�
************************************************************************************/
int udpCommInit()
{
	err_t err;

	/* create new udp PCB structure */
	g_udpPCB = udp_new();
	if( !g_udpPCB )
	{
		xil_printf( "Error creating PCB. Out of Memory\n\r" );
		return -1;
	}

	/* bind to specified @port */
	err = udp_bind(g_udpPCB, IP_ADDR_ANY, LOCAL_PORT);
	if( err != ERR_OK )
	{
		xil_printf( "\n\r Unable to bind to port %d : err = %d\n\r", LOCAL_PORT, err );
		return -2;
	}

//	IP4_ADDR( &g_remoteIPAddr,  172, 16, 1, 101 );
//	err = udp_connect( g_udpPCB, &g_remoteIPAddr, REMOTE_PORT );
//	if( err != ERR_OK )
//	{
//		xil_printf( "Unable to connect to port %d : err = %d\n\r", REMOTE_PORT, err );
//		return -3;
//	}
//	else
//	{
//		xil_printf( "udp connect success!\n\r" );
//	}

	udp_recv( g_udpPCB, udpCommRecvCallback, NULL );

	xil_printf( "\n\r udp server port %d\n\r", LOCAL_PORT );

	return 0;
}


/***********************************************************************************
  * �������ƣ�	udpCommRecvCallback()��
  * ����˵����	udp���ݽ��ջص�������
  * ���������	�ޣ�
  * ������� ��	�ޣ�
  * ���ز��� ��	�ޣ�
  * ��        ע��	�ޣ�
************************************************************************************/
void udpCommRecvCallback( void *arg, struct udp_pcb *pcb, struct pbuf *p,
	    ip_addr_t *addr, u16_t port )
{
	/* do not read the packet if we are not in ESTABLISHED state */
	if( !p )
	{
		udp_remove( pcb );
		return;
	}

	g_RX_sock_count += p->len;
//	xil_printf("udp recv len = %d\n\r", p->len);
//	xil_printf("udp recv : %s\n\r", p->payload);
//	writeData2DSP(1, p->len, (unsigned short *)p->payload);//����CPU0->CPU1
//	lwip_CopyData2FPGA_BUF2( ( unsigned short * )p->payload, ( unsigned short )p->len );

//	udp_send(pcb, p);

	/* free the received pbuf */
	pbuf_free( p );

	return;
}

/***********************************************************************************
  * �������ƣ�	vInitLwipSocket()��
  * ����˵����	udp socket��ʼ����
  * ���������	�ޣ�
  * ������� ��	�ޣ�
  * ���ز��� ��	�ޣ�
  * ��        ע��	�ޣ�
************************************************************************************/
int vInitLwipUDPSocket()
{
	struct sockaddr_in sLocalAddr;
	struct sockaddr_in client_addr;
	int lAddrLen;
	int nSocket = -1;

	nSocket = lwip_socket( AF_INET, SOCK_DGRAM, IPPROTO_UDP );
	if( nSocket < 0 )
	{
		xil_printf( "lwip_socket fail! nSocket = %d \n\r", nSocket );
		lwip_close( nSocket );
		return -1;
	}

	memset( ( char * )&sLocalAddr, 0, sizeof( sLocalAddr ) );
	sLocalAddr.sin_family = AF_INET;
	sLocalAddr.sin_len = sizeof( sLocalAddr );
	sLocalAddr.sin_addr.s_addr = htonl( INADDR_ANY );
	sLocalAddr.sin_port = ntohs( LOCAL_PORT );

	if( lwip_bind( nSocket, ( struct sockaddr *)&sLocalAddr, sizeof( sLocalAddr ) ) < 0 )
	{
		xil_printf( "lwip_bind fail! \n\r" );
		lwip_close( nSocket );
		return -1;
	}

	memset( ( char * )&client_addr, 0, sizeof( client_addr ) );
	sLocalAddr.sin_family = AF_INET;
	sLocalAddr.sin_len = sizeof( client_addr );
	sLocalAddr.sin_addr.s_addr = htonl( inet_addr( "172.16.1.199" ) );//htonl( INADDR_ANY );
	sLocalAddr.sin_port = ntohs( REMOTE_PORT );
	lAddrLen = sizeof( client_addr );
	if( lwip_connect( nSocket, ( struct sockaddr * )&client_addr, ( socklen_t )lAddrLen ) < 0 )
	{
		xil_printf( "lwip_connect fail! lAddrLen = %d \n\r", lAddrLen );
		lwip_close( nSocket );
		return -1;
	}
	xil_printf("\n\r lwip_connect success! \n\r");

//	int nRecvBuf = 64 * 1024;//64KB;
//	if( lwip_setsockopt( nSocket, SOL_SOCKET, SO_RCVBUF, &nRecvBuf, sizeof( int ) ) < 0 )
//	{
//		xil_printf( "lwip_setsockopt fail! \n\r" );
//		lwip_close( nSocket );
//		return -1;
//	}

	return nSocket;
}

/***********************************************************************************
  * �������ƣ�	vInitLwipTCPSocket()��
  * ����˵����	tcp socket��ʼ����
  * ���������	�ޣ�
  * ������� ��	�ޣ�
  * ���ز��� ��	�ޣ�
  * ��        ע��	�ޣ�
************************************************************************************/
int vInitLwipTCPSocket()
{
	int nSocket = -1, lAddrLen, lClientFd = -1;
	struct sockaddr_in sLocalAddr;
	struct sockaddr_in client_addr;

	nSocket = lwip_socket( AF_INET, SOCK_STREAM, IPPROTO_TCP );
	xil_printf("\n\rlwip_socket!, nSocket = %d \n\r", nSocket );
	if( nSocket < 0 )
	{
		xil_printf( "lwip_socket fail! nSocket = %d \n\r", nSocket );
		lwip_close( nSocket );
		return -1;
	}

	memset( ( char * )&sLocalAddr, 0, sizeof( sLocalAddr ) );
	sLocalAddr.sin_family = AF_INET;
	sLocalAddr.sin_len = sizeof( sLocalAddr );
	sLocalAddr.sin_addr.s_addr = htonl( INADDR_ANY );
	sLocalAddr.sin_port = ntohs( LOCAL_PORT );
	if( lwip_bind( nSocket, ( struct sockaddr *)&sLocalAddr, sizeof( sLocalAddr ) ) < 0 )
	{
		xil_printf( "lwip_bind fail! \n\r" );
		lwip_close( nSocket );
		return -1;
	}

	if( lwip_listen( nSocket, 20 ) != 0 )
	{
		lwip_close( nSocket );
		return -1;
	}

	lAddrLen = sizeof( struct sockaddr_in );

	while( lClientFd < 0 )
	{
		lClientFd = lwip_accept( nSocket, ( struct sockaddr * ) &client_addr, ( u32_t * ) &lAddrLen );
	}

	xil_printf( "lwip_accept success! lClientFd = %d\n\r", lClientFd );

	return lClientFd;
}

