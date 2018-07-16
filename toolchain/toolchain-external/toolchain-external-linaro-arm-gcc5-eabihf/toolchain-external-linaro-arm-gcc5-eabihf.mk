################################################################################
#
# toolchain-external-linaro-arm-gcc5-eabihf
#
################################################################################

TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABIHF_VERSION = 2017.10
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABIHF_SITE = https://releases.linaro.org/components/toolchain/binaries/5.5-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABIHF_VERSION)/arm-linux-gnueabihf

ifeq ($(HOSTARCH),x86)
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABIHF_SOURCE = gcc-linaro-5.5.0-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABIHF_VERSION)-i686_arm-linux-gnueabihf.tar.xz
else
TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABIHF_SOURCE = gcc-linaro-5.5.0-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_GCC5_EABIHF_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
endif

$(eval $(toolchain-external-package))
