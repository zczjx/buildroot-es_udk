################################################################################
#
# linux-3rd-lib-tests
#
################################################################################

LINUX_3RD_LIB_TESTS_VERSION = master

LINUX_3RD_LIB_TESTS_SITE_METHOD = git2
LINUX_3RD_LIB_TESTS_SITE = git@github.com:zczjx/linux-3rd-lib-tests.git
LINUX_3RD_LIB_TESTS_ALWAYS_BUILD = YES
LINUX_3RD_LIB_TESTS_INSTALL_STAGING = YES
LINUX_3RD_LIB_TESTS_DEPENDENCIES += libglib2
LINUX_3RD_LIB_TESTS_CFLAGS = -Wall -I $(STAGING_DIR)/usr/include -g \
							-L$(STAGING_DIR)/usr/lib -rdynamic -fPIC \
							-I $(@D)/include -L$(@D) -I $(STAGING_DIR)/usr/include/glib-2.0 \
							-I $(STAGING_DIR)/usr/lib/glib-2.0/include -O0
LINUX_3RD_LIB_TESTS_LDFLAGS += -lm -lpthread -L$(@D) -l3rd_common \
	-lglib-2.0 -lgmodule-2.0 -lgobject-2.0 -lgio-2.0 -lgthread-2.0
LINUX_3RD_LIB_TESTS_TEST_CASE_DIR = $(@D)/bin
LINUX_3RD_LIB_TESTS_COMMON_DLIB = lib3rd_common.so

LINUX_3RD_LIB_TESTS_MAKE_FLAGS += \
		CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
		CC="$(TARGET_CC)" \
		AR="$(TARGET_AR)" \
		STRIP="$(TARGET_STRIP)" \
		CFLAGS="$(LINUX_3RD_LIB_TESTS_CFLAGS)" \
		LDFLAGS="$(LINUX_3RD_LIB_TESTS_LDFLAGS)" \
		LINUX_3RD_COMMON_DLIB=$(LINUX_3RD_LIB_TESTS_COMMON_DLIB)

ifeq ($(BR2_PACKAGE_FFMPEG),y)
LINUX_3RD_LIB_TESTS_DEPENDENCIES += ffmpeg
LINUX_3RD_LIB_TESTS_MAKE_FLAGS += LINUX_3RD_LIB_FFMPEG=y
else
LINUX_3RD_LIB_TESTS_MAKE_FLAGS += LINUX_3RD_LIB_FFMPEG=n
endif

ifeq ($(BR2_PACKAGE_LIBV4L),y)
LINUX_3RD_LIB_TESTS_DEPENDENCIES += libv4l
LINUX_3RD_LIB_TESTS_MAKE_FLAGS += LINUX_3RD_LIB_LIBV4L2=y
else
LINUX_3RD_LIB_TESTS_MAKE_FLAGS += LINUX_3RD_LIB_LIBV4L2=n
endif

define LINUX_3RD_LIB_TESTS_BUILD_CMDS
	$(MAKE)  distclean  -C $(@D) 
	$(MAKE)  $(LINUX_3RD_LIB_TESTS_MAKE_FLAGS)  -C $(@D)
endef

define LINUX_3RD_LIB_TESTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/bin/* $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 -D $(@D)/$(LINUX_3RD_LIB_TESTS_COMMON_DLIB) $(TARGET_DIR)/usr/lib

endef

$(eval $(generic-package))
