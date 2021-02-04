/***********************************************************************************
* ��Ȩ����(C)2020, ���ݺ���ͨ�ż��Źɷ����޹�˾.
* ��Ŀ����:    S023
* �ļ�����:    main.c
* ����ƽ̨:    GCC
* ���뻷��:    GCC������
* ��������:    C
* ��       ��:    ����ǫ
* ����ժҪ:    ������
* �������:    2020��11��
************************************************************************************/
/***********************************************************************************
 *                                   ͷ �� ��
 ***********************************************************************************/
/********************************** ��׼ͷ�ļ� ****************************************/

/********************************* �Զ���ͷ�ļ� ***************************************/
#include "freeRTOS_user.h"
#include "lwipApps.h"
#include "dmaUser.h"
#include "hub_queue.h"

/******************************* freeRTOS ͷ�ļ� ************************************/
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

/******************************** lwip�� ͷ�ļ� **************************************/
#include "lwip/tcpip.h"

/******************************** Xilinx ͷ�ļ� *************************************/
#include "xil_printf.h"

/***********************************************************************************
 *                                   �� �� ��
 ***********************************************************************************/
#define mainQUEUE_RECEIVE_TASK_PRIORITY		( tskIDLE_PRIORITY + 2 )
#define mainQUEUE_SEND_TASK_PRIORITY		( tskIDLE_PRIORITY + 3 )
#define mainQUEUE_SEND_FREQUENCY_MS			( 1000 / portTICK_PERIOD_MS )

/***********************************************************************************
 *                                   ȫ �� �� ��
 ***********************************************************************************/
u32 g_RX_count  = 0;
u32 g_TX_count  = 0;
u32 g_RX_sock_count = 0;

/***********************************************************************************
 *                                �� �� �� �� �� ��
 ***********************************************************************************/
static void vTaskQueueReceive( void *pvParameters );
static void vTaskQueueSend( void *pvParameters );
static void vTaskCount( void *pvParameters );

/***********************************************************************************
 *                                 �� �� ԭ ��
 ***********************************************************************************/
/***********************************************************************************
  * �������ƣ�	main()��
  * ����˵����	��������
  * ���������	�ޣ�
  * ������� ��	�ޣ�
  * ���ز��� ��	�ޣ�
  * ��        ע��	�ޣ�
************************************************************************************/
int main( void )
{
	/* Configure the hardware ready to run the demo. */
	prvSetupHardware();

	initIntrDMASys();//DMA��ʼ����
	QueueInit();//��ʼ�����У�

	tcpip_init( lwIPAppsInit, NULL );

//	xTaskCreate( vTaskQueueReceive,				/* The function that implements the task. */
//				"Rx", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
//				configMINIMAL_STACK_SIZE, 			/* The size of the stack to allocate to the task. */
//				NULL, 								/* The parameter passed to the task - not used in this case. */
//				mainQUEUE_SEND_TASK_PRIORITY, 	/* The priority assigned to the task. */
//				NULL );								/* The task handle is not required, so NULL is passed. */

//	xTaskCreate( vTaskQueueSend, "TX", configMINIMAL_STACK_SIZE, NULL, mainQUEUE_SEND_TASK_PRIORITY, NULL );

	xTaskCreate( vTaskSockTransmit, "SockRecv",
				configMINIMAL_STACK_SIZE * 5, NULL, configCLI_TASK_PRIORITY, NULL );

	xTaskCreate( vTaskCount, "count", configMINIMAL_STACK_SIZE, NULL, mainQUEUE_SEND_TASK_PRIORITY, NULL );

	/* Start the tasks and timer running. */
	vTaskStartScheduler();

	while( 1 );//�����ܵ����

	return 0;
}


static void vTaskQueueReceive( void *pvParameters )
{
	/* Remove compiler warning about unused parameter. */
	( void ) pvParameters;

	xil_printf( "\n\r prvQueueReceiveTask! \n\r" );

	for( ;; )
	{
		RxDMA();
	}

	vTaskDelete( NULL );
}

static void vTaskQueueSend( void *pvParameters )
{

	/* Remove compiler warning about unused parameter. */
	( void ) pvParameters;

	xil_printf("\n\r prvQueueSendTask! \n\r");

	for( ;; )
	{
		lwip_readFromFPGAPriBuf();
	}

	vTaskDelete( NULL );
}

static void vTaskCount( void *pvParameters )
{
	TickType_t xNextWakeTime;
	u32 RX_count  = 0;
	u32 TX_count  = 0;
	u32 RX_sock_count = 0;

	/* Remove compiler warning about unused parameter. */
	( void ) pvParameters;

	xil_printf("\n\r prvCountTask! \n\r");

	xNextWakeTime = xTaskGetTickCount();

	for( ;; )
	{
		vTaskDelayUntil( &xNextWakeTime, mainQUEUE_SEND_FREQUENCY_MS );
		xil_printf( "g_RX_count = %u, RX speed = %u Bps; g_TX_count = %u, TX speed = %u Bps, g_RX_sock_count = %u, sock RX speed = %u \n\r",
				g_RX_count, ( g_RX_count - RX_count ), g_TX_count, ( g_TX_count - TX_count ),
				g_RX_sock_count, ( g_RX_sock_count - RX_sock_count ) );
		RX_count = g_RX_count;
		TX_count = g_TX_count;
		RX_sock_count = g_RX_sock_count;
	}

	vTaskDelete( NULL );
}

