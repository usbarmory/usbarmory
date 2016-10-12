################################################################################
#
# QUBES_APP_LINUX_SPLIT_GPG
#
################################################################################

QUBES_APP_LINUX_SPLIT_GPG_VERSION = HEAD
QUBES_APP_LINUX_SPLIT_GPG_SITE = $(call github,QubesOS,qubes-app-linux-split-gpg,$(QUBES_APP_LINUX_SPLIT_GPG_VERSION))
QUBES_APP_LINUX_SPLIT_GPG_REPO = https://github.com/QubesOS/qubes-app-linux-split-gpg

QUBES_APP_LINUX_SPLIT_GPG_LICENSE = GPLv2

define QUBES_APP_LINUX_SPLIT_GPG_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) build CC=$(TARGET_CC) -C $(@D)
	mkdir -p $(TARGET_DIR)/usr/lib/qubes-gpg-split
	$(INSTALL) -m 0755 -D $(@D)/src/gpg-server $(TARGET_DIR)/usr/lib/qubes-gpg-split
endef

$(eval $(generic-package))
