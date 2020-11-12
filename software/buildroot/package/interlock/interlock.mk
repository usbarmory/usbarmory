################################################################################
#
# INTERLOCK
#
################################################################################

INTERLOCK_VERSION = a0a1ade0d8da155190eb5f91da73b59fee9c8b8a
INTERLOCK_SITE = $(call github,f-secure-foundry,interlock,$(INTERLOCK_VERSION))
INTERLOCK_REPO = https://github.com/f-secure-foundry/interlock

INTERLOCK_LICENSE = GPLv3
INTERLOCK_LICENSE_FILES = LICENSE

# the INTERLOCK repository uses submodules which are not compliant with the
# Buildroot way, therefore we need a less than ideal hack inspired by
# http://lists.busybox.net/pipermail/buildroot/2013-March/069811.html
define INTERLOCK_EXTRACT_CMDS
	rm -rf $(@D)
	(git clone  $(INTERLOCK_REPO) $(@D) && \
	cd $(@D) && \
	git checkout $(INTERLOCK_VERSION) && \
	git submodule init && \
	git submodule update)
	touch $(@D)/.stamp_downloaded
endef

INTERLOCK_MAKE_TARGET="build"

define INTERLOCK_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(INTERLOCK_MAKE_TARGET) GOARCH=arm CC=$(TARGET_CC) CGO_ENABLED=1 -C $(@D)
	mkdir -p $(TARGET_DIR)/usr/share/interlock
	cp -r $(@D)/static $(TARGET_DIR)/usr/share/interlock
	$(INSTALL) -m 0755 -D $(@D)/interlock $(TARGET_DIR)/usr/bin/interlock
endef

$(eval $(generic-package))
