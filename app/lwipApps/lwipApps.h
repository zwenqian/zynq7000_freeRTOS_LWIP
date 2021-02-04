/***********************************************************************************
* 版权所有(C)2020, 广州海格通信集团股份有限公司.
* 项目代号:    S023
* 文件名称:    lwipApps.h
* 运行平台:    GCC
* 编译环境:    GCC编译器
* 程序语言:    C
* 作       者:    张问谦
* 内容摘要:    LWIP用户接口模块
* 完成日期:    2020年11月
************************************************************************************/

#ifndef SRC_LWIPAPPS_H_
#define SRC_LWIPAPPS_H_

/*************************** 套接字前向数据流结构体 *******************************/
typedef struct
{
    unsigned char cPackType;//包类型：0-请求数据包; 1-控制包;
    unsigned int nSequenceID;//包序号，非重传的数据包序号加1;
    unsigned char cCtrType;//控制包类型;当时请求数据包时无意义为0,当是控制包时1-接收成功;2-包序出错;
    unsigned short sDataLen;//数据包长度;
    char *pcDataBytes;//有效数据;
}SockForwardDataStream;

/***********************************************************************************
 *                                外 部 函 数 申 明
 ***********************************************************************************/
void lwIPAppsInit( void *pvArguments );
void vTaskSockTransmit( void *pvParameters );

#endif /* SRC_LWIPAPPS_H_ */
