################################################################################
#
# demo app
#
################################################################################

ES_COMMON_VERSION = master

ES_COMMON_SITE_METHOD = git2
ES_COMMON_SITE = git@github.com:zczjx/es_common.git
# ES_COMMON_SOURCE = es_common-$(ES_COMMON_VERSION).tar.gz
ES_COMMON_ALWAYS_BUILD = YES
ES_COMMON_INSTALL_STAGING = YES
ES_COMMON_CFLAGS = "-Wall -I $(STAGING_DIR)/usr/include -g -rdynamic  -fPIC  -L$(STAGING_DIR)/usr/lib"
ES_COMMON_LDFLAGS = "-lm "
ES_COMMON_OUT_SLIB = libes_common.a
ES_COMMON_OUT_DLIB = libes_common.so
ES_COMMON_MAKE_FLAGS += \
		CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
		CC=$(TARGET_CC)      \
		AR=$(TARGET_AR)      \
		STRIP=$(TARGET_STRIP) \
		CFLAGS=$(ES_COMMON_CFLAGS) \
		LDFLAGS=$(ES_COMMON_LDFLAGS) 

define ES_COMMON_BUILD_CMDS
	$(INSTALL) -m 0755 -D $(@D)/include/* $(STAGING_DIR)/usr/include
	$(MAKE)  distclean  -C $(@D) 
	$(MAKE)  $(ES_COMMON_MAKE_FLAGS)  -C $(@D)
	$(MAKE)  test_case $(ES_COMMON_MAKE_FLAGS)  -C $(@D)
endef

define ES_COMMON_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/$(ES_COMMON_OUT_SLIB)  $(STAGING_DIR)/usr/lib
	$(INSTALL) -m 0755 -D $(@D)/$(ES_COMMON_OUT_DLIB)  $(STAGING_DIR)/usr/lib
	echo $(TARGET_DIR)
	$(INSTALL) -m 0755 -D $(@D)/$(ES_COMMON_OUT_DLIB)  $(TARGET_DIR)/usr/lib

endef

$(eval $(generic-package))
