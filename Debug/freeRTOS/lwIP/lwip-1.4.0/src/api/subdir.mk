################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freeRTOS/lwIP/lwip-1.4.0/src/api/api_lib.c \
../freeRTOS/lwIP/lwip-1.4.0/src/api/api_msg.c \
../freeRTOS/lwIP/lwip-1.4.0/src/api/err.c \
../freeRTOS/lwIP/lwip-1.4.0/src/api/netbuf.c \
../freeRTOS/lwIP/lwip-1.4.0/src/api/netdb.c \
../freeRTOS/lwIP/lwip-1.4.0/src/api/netifapi.c \
../freeRTOS/lwIP/lwip-1.4.0/src/api/sockets.c \
../freeRTOS/lwIP/lwip-1.4.0/src/api/tcpip.c 

OBJS += \
./freeRTOS/lwIP/lwip-1.4.0/src/api/api_lib.o \
./freeRTOS/lwIP/lwip-1.4.0/src/api/api_msg.o \
./freeRTOS/lwIP/lwip-1.4.0/src/api/err.o \
./freeRTOS/lwIP/lwip-1.4.0/src/api/netbuf.o \
./freeRTOS/lwIP/lwip-1.4.0/src/api/netdb.o \
./freeRTOS/lwIP/lwip-1.4.0/src/api/netifapi.o \
./freeRTOS/lwIP/lwip-1.4.0/src/api/sockets.o \
./freeRTOS/lwIP/lwip-1.4.0/src/api/tcpip.o 

C_DEPS += \
./freeRTOS/lwIP/lwip-1.4.0/src/api/api_lib.d \
./freeRTOS/lwIP/lwip-1.4.0/src/api/api_msg.d \
./freeRTOS/lwIP/lwip-1.4.0/src/api/err.d \
./freeRTOS/lwIP/lwip-1.4.0/src/api/netbuf.d \
./freeRTOS/lwIP/lwip-1.4.0/src/api/netdb.d \
./freeRTOS/lwIP/lwip-1.4.0/src/api/netifapi.d \
./freeRTOS/lwIP/lwip-1.4.0/src/api/sockets.d \
./freeRTOS/lwIP/lwip-1.4.0/src/api/tcpip.d 


# Each subdirectory must supply rules for building sources it contributes
freeRTOS/lwIP/lwip-1.4.0/src/api/%.o: ../freeRTOS/lwIP/lwip-1.4.0/src/api/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../app_cpu1_hub_bsp/ps7_cortexa9_1/include -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable\GCC\ARM_CA9" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable\MemMang" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwIP_port\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwIP_port\netif" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwip-1.4.0\src\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwip-1.4.0\src\include\ipv4" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\lwipApps" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\dma" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\queue" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


