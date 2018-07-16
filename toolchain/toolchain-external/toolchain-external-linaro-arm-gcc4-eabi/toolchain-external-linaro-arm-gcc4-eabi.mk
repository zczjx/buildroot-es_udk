################################################################################
#
# toolchain-external-linaro-arm-gcc4-eabi
#
################################################################################

TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABI_VERSION = 2017.01
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABI_SITE = https://releases.linaro.org/components/toolchain/binaries/4.9-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABI_VERSION)/arm-linux-gnueabi

ifeq ($(HOSTARCH),x86)
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABI_SOURCE = gcc-linaro-4.9.4-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABI_VERSION)-i686_arm-linux-gnueabi.tar.xz
else
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABI_SOURCE = gcc-linaro-4.9.4-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABI_VERSION)-x86_64_arm-linux-gnueabi.tar.xz
endif

$(eval $(toolchain-external-package))
