################################################################################
#
# Build the ext4 tiny4412 root filesystem image
#
################################################################################

EXT4_TINY4412_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT4_TINY4412_SIZE))
ifeq ($(BR2_TARGET_ROOTFS_EXT4_TINY4412)-$(BR2_TARGET_ROOTFS_EXT4_TINY4412_SIZE),y-)
$(error BR2_TARGET_ROOTFS_EXT4_TINY4412_SIZE cannot be empty)
endif

EXT4_TINY4412_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT4_TINY4412_MKFS_OPTIONS))
# qstrip results in stripping consecutive spaces into a single one. So the
# variable is not qstrip-ed to preserve the integrity of the string value.
EXT4_TINY4412_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT4_TINY4412_LABEL))
#" Syntax highlighting... :-/ )

EXT4_TINY4412_OPTS = \
	 $(EXT4_TINY4412_MKFS_OPTS) \
	-l $(EXT4_TINY4412_SIZE) \
	-L $(EXT4_TINY4412_LABEL) \

ROOTFS_EXT4_TINY4412_DEPENDENCIES = host-e2fsprogs

define ROOTFS_EXT4_TINY4412_CMD
	rm -f $@
	fs/ext4_tiny4412/make_ext4fs $(EXT4_TINY4412_OPTS) $@ $(TARGET_DIR)
endef


$(eval $(rootfs))
