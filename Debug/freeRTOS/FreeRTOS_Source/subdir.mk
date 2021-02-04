################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freeRTOS/FreeRTOS_Source/croutine.c \
../freeRTOS/FreeRTOS_Source/event_groups.c \
../freeRTOS/FreeRTOS_Source/list.c \
../freeRTOS/FreeRTOS_Source/queue.c \
../freeRTOS/FreeRTOS_Source/stream_buffer.c \
../freeRTOS/FreeRTOS_Source/tasks.c \
../freeRTOS/FreeRTOS_Source/timers.c 

OBJS += \
./freeRTOS/FreeRTOS_Source/croutine.o \
./freeRTOS/FreeRTOS_Source/event_groups.o \
./freeRTOS/FreeRTOS_Source/list.o \
./freeRTOS/FreeRTOS_Source/queue.o \
./freeRTOS/FreeRTOS_Source/stream_buffer.o \
./freeRTOS/FreeRTOS_Source/tasks.o \
./freeRTOS/FreeRTOS_Source/timers.o 

C_DEPS += \
./freeRTOS/FreeRTOS_Source/croutine.d \
./freeRTOS/FreeRTOS_Source/event_groups.d \
./freeRTOS/FreeRTOS_Source/list.d \
./freeRTOS/FreeRTOS_Source/queue.d \
./freeRTOS/FreeRTOS_Source/stream_buffer.d \
./freeRTOS/FreeRTOS_Source/tasks.d \
./freeRTOS/FreeRTOS_Source/timers.d 


# Each subdirectory must supply rules for building sources it contributes
freeRTOS/FreeRTOS_Source/%.o: ../freeRTOS/FreeRTOS_Source/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../app_cpu1_hub_bsp/ps7_cortexa9_1/include -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable\GCC\ARM_CA9" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable\MemMang" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwIP_port\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwIP_port\netif" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwip-1.4.0\src\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwip-1.4.0\src\include\ipv4" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\lwipApps" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\dma" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\queue" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


