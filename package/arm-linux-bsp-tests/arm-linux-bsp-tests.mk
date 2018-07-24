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
ARM_LINUX_BSP_TESTS_DEPENDENCIES +=
ARM_LINUX_BSP_TESTS_CFLAGS = -Wall -I $(STAGING_DIR)/usr/include -g \
							-rdynamic -fPIC  -L$(STAGING_DIR)/usr/lib \
							-I $(@D)/include
ARM_LINUX_BSP_TESTS_LDFLAGS +=
ARM_LINUX_BSP_TESTS_TEST_CASE_DIR = $(@D)/bin

ARM_LINUX_BSP_TESTS_MAKE_FLAGS += \
		CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
		CC=$(TARGET_CC)      \
		AR=$(TARGET_AR)      \
		STRIP=$(TARGET_STRIP) \
		CFLAGS="$(ARM_LINUX_BSP_TESTS_CFLAGS)" \
		LDFLAGS="$(ARM_LINUX_BSP_TESTS_LDFLAGS)" \

define ARM_LINUX_BSP_TESTS_BUILD_CMDS
	$(MAKE)  distclean  -C $(@D) 
	$(MAKE)  $(ARM_LINUX_BSP_TESTS_MAKE_FLAGS)  -C $(@D)
endef

define ARM_LINUX_BSP_TESTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/bin/* $(TARGET_DIR)/usr/bin

endef

$(eval $(generic-package))
