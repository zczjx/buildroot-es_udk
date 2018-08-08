################################################################################
#
# arm-linux-bsp-tests
#
################################################################################

ARM_LINUX_BSP_TESTS_VERSION = master

ARM_LINUX_BSP_TESTS_SITE_METHOD = git2
ARM_LINUX_BSP_TESTS_SITE = git@github.com:zczjx/arm-linux-bsp-tests.git
ARM_LINUX_BSP_TESTS_ALWAYS_BUILD = YES
ARM_LINUX_BSP_TESTS_INSTALL_STAGING = YES
ARM_LINUX_BSP_TESTS_DEPENDENCIES += libglib2
ARM_LINUX_BSP_TESTS_CFLAGS = -Wall -I $(STAGING_DIR)/usr/include -g \
							-rdynamic -fPIC  -L$(STAGING_DIR)/usr/lib \
							-I $(@D)/include -L$(@D)
ARM_LINUX_BSP_TESTS_LDFLAGS += -lm -lpthread -L$(@D) -lcommon_bsp \
	-lglib-2.0 -lgmodule-2.0 -lgobject-2.0 -lgio-2.0 -lgthread-2.0
ARM_LINUX_BSP_TESTS_TEST_CASE_DIR = $(@D)/bin
ARM_LINUX_BSP_TESTS_COMMON_DLIB = libcommon_bsp.so

ARM_LINUX_BSP_TESTS_MAKE_FLAGS += \
		CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
		CC="$(TARGET_CC)" \
		AR="$(TARGET_AR)" \
		STRIP="$(TARGET_STRIP)" \
		CFLAGS="$(ARM_LINUX_BSP_TESTS_CFLAGS)" \
		LDFLAGS="$(ARM_LINUX_BSP_TESTS_LDFLAGS)" \
		BSP_DLIB=$(ARM_LINUX_BSP_TESTS_COMMON_DLIB)

ifeq ($(BR2_PACKAGE_ARM_LINUX_BSP_TESTS_RPI),y)
ARM_LINUX_BSP_TESTS_DEPENDENCIES += rpi-firmware rpi-userland
ARM_LINUX_BSP_TESTS_MAKE_FLAGS += ARM_LINUX_BSP_RPI=y
else
ARM_LINUX_BSP_TESTS_MAKE_FLAGS += ARM_LINUX_BSP_RPI=n
endif

ifeq ($(BR2_PACKAGE_ARM_LINUX_BSP_TESTS_EXYNOS_4412),y)
ARM_LINUX_BSP_TESTS_MAKE_FLAGS += ARM_LINUX_BSP_EXYNOS_4412=y
else
ARM_LINUX_BSP_TESTS_MAKE_FLAGS += ARM_LINUX_BSP_EXYNOS_4412=n
endif

define ARM_LINUX_BSP_TESTS_BUILD_CMDS
	$(MAKE)  distclean  -C $(@D) 
	$(MAKE)  $(ARM_LINUX_BSP_TESTS_MAKE_FLAGS)  -C $(@D)
endef

define ARM_LINUX_BSP_TESTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/bin/* $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 -D $(@D)/$(ARM_LINUX_BSP_TESTS_COMMON_DLIB) $(TARGET_DIR)/usr/lib

endef

$(eval $(generic-package))
