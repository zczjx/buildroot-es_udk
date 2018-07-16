################################################################################
#
# toolchain-external-linaro-aarch64-gcc6
#
################################################################################

TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC6_VERSION = 2018.05
TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC6_SITE = https://releases.linaro.org/components/toolchain/binaries/6.4-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC6_VERSION)/aarch64-linux-gnu

ifeq ($(HOSTARCH),x86)
TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC6_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC6_VERSION)-i686_aarch64-linux-gnu.tar.xz
else
TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC6_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_GCC6_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
endif

$(eval $(toolchain-external-package))
