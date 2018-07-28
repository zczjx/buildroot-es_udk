################################################################################
#
# es_demo_cv_detect
#
################################################################################
ES_DEMO_CV_DETECT_VERSION = master
ES_DEMO_CV_DETECT_SITE_METHOD = git2
ES_DEMO_CV_DETECT_SITE = git@Chow:/home/git/git_repo/es_demo_cv_detect.git
# ES_DEMO_CV_DETECT_SOURCE = ES_DEMO_CV_DETECT-$(ES_DEMO_CV_DETECT_VERSION).tar.gz
ES_DEMO_CV_DETECT_ALWAYS_BUILD = YES
ES_DEMO_CV_DETECT_INSTALL_STAGING = YES
ES_DEMO_CV_DETECT_DEPENDENCIES = opencv3
ES_DEMO_CV_DETECT_CFLAGS = 
ES_DEMO_CV_DETECT_LDFLAGS = "-lopencv_core -lopencv_imgcodecs -lopencv_videoio \
							-lopencv_imgproc -lopencv_highgui -lopencv_objdetect \
							-lpthread"
OUT_BIN = es_demo_cv_detect
ES_DEMO_CV_DETECT_MAKE_FLAGS += \
		CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
		CC=$(TARGET_CC)      \
		CXX=$(TARGET_CXX) \
		LD=$(TARGET_LD) \
		OUT_BIN=$(OUT_BIN)  \
		AR=$(TARGET_AR)      \
		STRIP=$(TARGET_STRIP) \
		CFLAGS=$(ES_DEMO_CV_DETECT_CFLAGS) \
		LDFLAGS=$(ES_DEMO_CV_DETECT_LDFLAGS) \
		STAGING_DIR=$(STAGING_DIR)  \
		TARGET_DIR=$(TARGET_DIR) 
 
define ES_DEMO_CV_DETECT_BUILD_CMDS
	$(MAKE) clean  -C $(@D) 
	$(MAKE) $(ES_DEMO_CV_DETECT_MAKE_FLAGS)  -C $(@D)
endef
 
define ES_DEMO_CV_DETECT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/$(OUT_BIN)  $(TARGET_DIR)/usr/bin
endef
 
$(eval $(generic-package))
