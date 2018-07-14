################################################################################
#
# es_udk
#
################################################################################

ES_UDK_VERSION = master

ES_UDK_SITE_METHOD = git2
ES_UDK_SITE = git@github.com:zczjx/es_udk.git
# ES_UDK_SOURCE = es_udk-$(ES_UDK_VERSION).tar.gz
ES_UDK_ALWAYS_BUILD = YES
ES_UDK_INSTALL_STAGING = YES
ES_UDK_DEPENDENCIES += es_common
ES_UDK_CFLAGS = -Wall -I $(STAGING_DIR)/usr/include -g  -rdynamic -fPIC  -L$(STAGING_DIR)/usr/lib
ES_UDK_LDFLAGS += -les_common
ES_UDK_OUT_SLIB = libes_udk.a
ES_UDK_OUT_DLIB = libes_udk.so
ES_UDK_TEST_CASE_DIR = test_case/linux/bin

ES_UDK_DEPENDENCIES += ffmpeg
ES_UDK_LDFLAGS += -lswscale -lavutil -lavcodec
# ES_UDK_CFLAGS +=  -I $(STAGING_DIR)/usr/include/libswscale
# ES_UDK_CFLAGS +=  -I $(STAGING_DIR)/usr/include/libavutil

ES_UDK_MAKE_FLAGS += \
		CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
		CC=$(TARGET_CC)      \
		AR=$(TARGET_AR)      \
		STRIP=$(TARGET_STRIP) \
		CFLAGS="$(ES_UDK_CFLAGS)" \
		LDFLAGS="$(ES_UDK_LDFLAGS)" \
		D_OUT=$(ES_UDK_OUT_DLIB) \
		S_OUT=$(ES_UDK_OUT_SLIB) 

define ES_UDK_BUILD_CMDS
	$(INSTALL) -m 0755 -D $(@D)/include/* $(STAGING_DIR)/usr/include
	$(MAKE)  distclean  -C $(@D) 
	$(MAKE)  $(ES_UDK_MAKE_FLAGS)  -C $(@D)
	$(MAKE)  test_case $(ES_UDK_MAKE_FLAGS)  -C $(@D)
endef

define ES_UDK_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/$(ES_UDK_OUT_SLIB)  $(STAGING_DIR)/usr/lib
	$(INSTALL) -m 0755 -D $(@D)/$(ES_UDK_OUT_DLIB)  $(STAGING_DIR)/usr/lib
	$(INSTALL) -m 0755 -D $(@D)/$(ES_UDK_OUT_DLIB)  $(TARGET_DIR)/usr/lib
	$(INSTALL) -m 0755 -D $(@D)/$(ES_UDK_TEST_CASE_DIR)/* $(TARGET_DIR)/usr/bin

endef

$(eval $(generic-package))
