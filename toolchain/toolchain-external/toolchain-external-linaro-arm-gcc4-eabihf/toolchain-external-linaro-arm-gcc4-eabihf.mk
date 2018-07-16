################################################################################
#
# toolchain-external-linaro-arm-gcc4-eabihf
#
################################################################################

TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABIHF_VERSION = 2017.01
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABIHF_SITE = https://releases.linaro.org/components/toolchain/binaries/4.9-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABIHF_VERSION)/arm-linux-gnueabihf

ifeq ($(HOSTARCH),x86)
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABIHF_SOURCE = gcc-linaro-4.9.4-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABIHF_VERSION)-i686_arm-linux-gnueabihf.tar.xz
else
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABIHF_SOURCE = gcc-linaro-4.9.4-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC4_EABIHF_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
endif

$(eval $(toolchain-external-package))
