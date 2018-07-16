################################################################################
#
# toolchain-external-linaro-arm-gcc5-eabi
#
################################################################################

TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABI_VERSION = 2017.10
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABI_SITE = https://releases.linaro.org/components/toolchain/binaries/5.5-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABI_VERSION)/arm-linux-gnueabi

ifeq ($(HOSTARCH),x86)
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABI_SOURCE = gcc-linaro-5.5.0-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABI_VERSION)-i686_arm-linux-gnueabi.tar.xz
else
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABI_SOURCE = gcc-linaro-5.5.0-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABI_VERSION)-x86_64_arm-linux-gnueabi.tar.xz
endif

$(eval $(toolchain-external-package))
