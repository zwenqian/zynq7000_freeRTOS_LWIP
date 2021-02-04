################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freeRTOS/lwIP/lwIP_port/netif/xadapter.c \
../freeRTOS/lwIP/lwIP_port/netif/xemacpsif.c \
../freeRTOS/lwIP/lwIP_port/netif/xemacpsif_dma.c \
../freeRTOS/lwIP/lwIP_port/netif/xemacpsif_hw.c \
../freeRTOS/lwIP/lwIP_port/netif/xemacpsif_physpeed.c \
../freeRTOS/lwIP/lwIP_port/netif/xpqueue.c \
../freeRTOS/lwIP/lwIP_port/netif/xtopology_g.c 

OBJS += \
./freeRTOS/lwIP/lwIP_port/netif/xadapter.o \
./freeRTOS/lwIP/lwIP_port/netif/xemacpsif.o \
./freeRTOS/lwIP/lwIP_port/netif/xemacpsif_dma.o \
./freeRTOS/lwIP/lwIP_port/netif/xemacpsif_hw.o \
./freeRTOS/lwIP/lwIP_port/netif/xemacpsif_physpeed.o \
./freeRTOS/lwIP/lwIP_port/netif/xpqueue.o \
./freeRTOS/lwIP/lwIP_port/netif/xtopology_g.o 

C_DEPS += \
./freeRTOS/lwIP/lwIP_port/netif/xadapter.d \
./freeRTOS/lwIP/lwIP_port/netif/xemacpsif.d \
./freeRTOS/lwIP/lwIP_port/netif/xemacpsif_dma.d \
./freeRTOS/lwIP/lwIP_port/netif/xemacpsif_hw.d \
./freeRTOS/lwIP/lwIP_port/netif/xemacpsif_physpeed.d \
./freeRTOS/lwIP/lwIP_port/netif/xpqueue.d \
./freeRTOS/lwIP/lwIP_port/netif/xtopology_g.d 


# Each subdirectory must supply rules for building sources it contributes
freeRTOS/lwIP/lwIP_port/netif/%.o: ../freeRTOS/lwIP/lwIP_port/netif/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../app_cpu1_hub_bsp/ps7_cortexa9_1/include -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable\GCC\ARM_CA9" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable\MemMang" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwIP_port\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwIP_port\netif" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwip-1.4.0\src\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwip-1.4.0\src\include\ipv4" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\lwipApps" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\dma" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\queue" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


