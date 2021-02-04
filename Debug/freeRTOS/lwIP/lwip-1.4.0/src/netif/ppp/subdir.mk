################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/auth.c \
../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/chap.c \
../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/chpms.c \
../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/fsm.c \
../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/ipcp.c \
../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/lcp.c \
../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/magic.c \
../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/md5.c \
../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/pap.c \
../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/ppp.c \
../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/ppp_oe.c \
../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/randm.c \
../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/vj.c 

OBJS += \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/auth.o \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/chap.o \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/chpms.o \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/fsm.o \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/ipcp.o \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/lcp.o \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/magic.o \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/md5.o \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/pap.o \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/ppp.o \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/ppp_oe.o \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/randm.o \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/vj.o 

C_DEPS += \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/auth.d \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/chap.d \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/chpms.d \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/fsm.d \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/ipcp.d \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/lcp.d \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/magic.d \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/md5.d \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/pap.d \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/ppp.d \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/ppp_oe.d \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/randm.d \
./freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/vj.d 


# Each subdirectory must supply rules for building sources it contributes
freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/%.o: ../freeRTOS/lwIP/lwip-1.4.0/src/netif/ppp/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../app_cpu1_hub_bsp/ps7_cortexa9_1/include -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable\GCC\ARM_CA9" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable\MemMang" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwIP_port\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwIP_port\netif" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwip-1.4.0\src\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwip-1.4.0\src\include\ipv4" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\lwipApps" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\dma" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\queue" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


