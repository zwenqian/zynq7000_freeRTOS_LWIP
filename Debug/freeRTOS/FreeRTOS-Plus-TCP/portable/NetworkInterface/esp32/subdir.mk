################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freeRTOS/FreeRTOS-Plus-TCP/portable/NetworkInterface/esp32/NetworkInterface.c 

OBJS += \
./freeRTOS/FreeRTOS-Plus-TCP/portable/NetworkInterface/esp32/NetworkInterface.o 

C_DEPS += \
./freeRTOS/FreeRTOS-Plus-TCP/portable/NetworkInterface/esp32/NetworkInterface.d 


# Each subdirectory must supply rules for building sources it contributes
freeRTOS/FreeRTOS-Plus-TCP/portable/NetworkInterface/esp32/%.o: ../freeRTOS/FreeRTOS-Plus-TCP/portable/NetworkInterface/esp32/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../app_cpu1_hub_bsp/ps7_cortexa9_1/include -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable\GCC\ARM_CA9" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable\MemMang" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwIP_port\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwIP_port\netif" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwip-1.4.0\src\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwip-1.4.0\src\include\ipv4" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\lwipApps" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\dma" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS-Plus-TCP\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS-Plus-TCP\portable\Compiler\GCC" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


