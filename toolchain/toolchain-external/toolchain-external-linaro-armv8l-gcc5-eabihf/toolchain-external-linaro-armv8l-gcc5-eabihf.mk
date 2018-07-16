################################################################################
#
# toolchain-external-linaro-armv8l-gcc5-eabihf
#
################################################################################

TOOLCHAIN_EXTERNAL_LINARO_ARMV8L_GCC5_EABIHF_VERSION = 2017.10
TOOLCHAIN_EXTERNAL_LINARO_ARMV8L_GCC5_EABIHF_SITE = https://releases.linaro.org/components/toolchain/binaries/5.5-$(TOOLCHAIN_EXTERNAL_LINARO_ARMV8L_GCC5_EABIHF_VERSION)/armv8l-linux-gnueabihf

ifeq ($(HOSTARCH),x86)
TOOLCHAIN_EXTERNAL_LINARO_ARMV8L_GCC5_EABIHF_SOURCE = gcc-linaro-5.5.0-$(TOOLCHAIN_EXTERNAL_LINARO_ARMV8L_GCC5_EABIHF_VERSION)-i686_armv8l-linux-gnueabihf.tar.xz
else
TOOLCHAIN_EXTERNAL_LINARO_ARMV8L_GCC5_EABIHF_SOURCE = gcc-linaro-5.5.0-$(TOOLCHAIN_EXTERNAL_LINARO_ARMV8L_GCC5_EABIHF_VERSION)-x86_64_armv8l-linux-gnueabihf.tar.xz
endif

$(eval $(toolchain-external-package))
