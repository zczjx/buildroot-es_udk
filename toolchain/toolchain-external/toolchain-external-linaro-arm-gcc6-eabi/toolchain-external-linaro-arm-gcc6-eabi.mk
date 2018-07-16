################################################################################
#
# toolchain-external-linaro-arm-gcc6-eabi
#
################################################################################

TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC6_EABI_VERSION = 2018.05
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC6_EABI_SITE = https://releases.linaro.org/components/toolchain/binaries/6.4-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC6_EABI_VERSION)/arm-linux-gnueabi

ifeq ($(HOSTARCH),x86)
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC6_EABI_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC6_EABI_VERSION)-i686_arm-linux-gnueabi.tar.xz
else
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC6_EABI_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC6_EABI_VERSION)-x86_64_arm-linux-gnueabi.tar.xz
endif

$(eval $(toolchain-external-package))
