################################################################################
#
# tiny4412-userland
#
################################################################################

TINY4412_USERLAND_VERSION = master
TINY4412_USERLAND_SITE_METHOD = git2
TINY4412_USERLAND_SITE = https://github.com/zczjx/tiny4412-userland.git
TINY4412_USERLAND_LICENSE = Apache-2.0
TINY4412_USERLAND_LICENSE_FILES = LICENCE
TINY4412_USERLAND_INSTALL_STAGING = YES
TINY4412_USERLAND_DEPENDENCIES += 

define TINY4412_USERLAND_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/etc/init.d/* $(TARGET_DIR)/etc/init.d/
	$(INSTALL) -m 0755 -D $(@D)/etc/eth0-setting $(TARGET_DIR)/etc/
	mkdir -p $(TARGET_DIR)/lib/firmware
	$(INSTALL) -m 0755 -D $(@D)/lib/firmware/* $(TARGET_DIR)/lib/firmware/

endef


$(eval $(generic-package))

