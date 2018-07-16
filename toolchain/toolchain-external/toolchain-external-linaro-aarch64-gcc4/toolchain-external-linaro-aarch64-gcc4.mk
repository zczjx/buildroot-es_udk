################################################################################
#
# toolchain-external-linaro-aarch64-gcc4
#
################################################################################

TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC4_VERSION = 2017.01
TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC4_SITE = https://releases.linaro.org/components/toolchain/binaries/4.9-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC4_VERSION)/aarch64-linux-gnu

ifeq ($(HOSTARCH),x86)
TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC4_SOURCE = gcc-linaro-4.9.4-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC4_VERSION)-i686_aarch64-linux-gnu.tar.xz
else
TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC4_SOURCE = gcc-linaro-4.9.4-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC4_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
endif

$(eval $(toolchain-external-package))
