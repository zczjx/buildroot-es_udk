################################################################################
#
# toolchain-external-linaro-armv8l-gcc6-eabihf
#
################################################################################

TOOLCHAIN_EXTERNAL_LINARO_ARMV8L_GCC6_EABIHF_VERSION = 2018.05
TOOLCHAIN_EXTERNAL_LINARO_ARMV8L_GCC6_EABIHF_SITE = https://releases.linaro.org/components/toolchain/binaries/6.4-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC6_EABI_VERSION)/armv8l-linux-gnueabihf

ifeq ($(HOSTARCH),x86)
TOOLCHAIN_EXTERNAL_LINARO_ARMV8L_GCC6_EABIHF_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC6_EABI_VERSION)-i686_armv8l-linux-gnueabihf.tar.xz
else
TOOLCHAIN_EXTERNAL_LINARO_ARMV8L_GCC6_EABIHF_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC6_EABI_VERSION)-x86_64_armv8l-linux-gnueabihf.tar.xz
endif

$(eval $(toolchain-external-package))
