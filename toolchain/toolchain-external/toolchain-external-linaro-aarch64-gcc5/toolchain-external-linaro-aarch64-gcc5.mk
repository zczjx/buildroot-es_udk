################################################################################
#
# toolchain-external-linaro-aarch64-gcc5
#
################################################################################

TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC5_VERSION = 2017.10
TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC5_SITE = https://releases.linaro.org/components/toolchain/binaries/5.5-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC5_VERSION)/aarch64-linux-gnu

ifeq ($(HOSTARCH),x86)
TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC5_SOURCE = gcc-linaro-5.5.0-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC5_VERSION)-i686_aarch64-linux-gnu.tar.xz
else
TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC5_SOURCE = gcc-linaro-5.5.0-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC5_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
endif

$(eval $(toolchain-external-package))
