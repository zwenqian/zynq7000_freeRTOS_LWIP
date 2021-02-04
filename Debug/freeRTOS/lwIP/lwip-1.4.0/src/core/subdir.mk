################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freeRTOS/lwIP/lwip-1.4.0/src/core/def.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/dhcp.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/dns.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/init.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/lwip_timers.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/mem.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/memp.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/netif.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/pbuf.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/raw.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/stats.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/sys.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/tcp.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/tcp_in.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/tcp_out.c \
../freeRTOS/lwIP/lwip-1.4.0/src/core/udp.c 

OBJS += \
./freeRTOS/lwIP/lwip-1.4.0/src/core/def.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/dhcp.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/dns.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/init.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/lwip_timers.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/mem.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/memp.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/netif.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/pbuf.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/raw.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/stats.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/sys.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/tcp.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/tcp_in.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/tcp_out.o \
./freeRTOS/lwIP/lwip-1.4.0/src/core/udp.o 

C_DEPS += \
./freeRTOS/lwIP/lwip-1.4.0/src/core/def.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/dhcp.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/dns.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/init.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/lwip_timers.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/mem.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/memp.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/netif.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/pbuf.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/raw.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/stats.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/sys.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/tcp.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/tcp_in.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/tcp_out.d \
./freeRTOS/lwIP/lwip-1.4.0/src/core/udp.d 


# Each subdirectory must supply rules for building sources it contributes
freeRTOS/lwIP/lwip-1.4.0/src/core/%.o: ../freeRTOS/lwIP/lwip-1.4.0/src/core/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../app_cpu1_hub_bsp/ps7_cortexa9_1/include -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable\GCC\ARM_CA9" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\FreeRTOS_Source\portable\MemMang" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwIP_port\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwIP_port\netif" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwip-1.4.0\src\include" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\freeRTOS\lwIP\lwip-1.4.0\src\include\ipv4" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\lwipApps" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\dma" -I"F:\projectWork\embedded_platform\MIZ7035\projects\hub_ex_sys\hub_ex_sys.sdk\app_cpu1_hub\app\queue" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


