################################################################################
#
# INTERLOCK
#
################################################################################

INTERLOCK_VERSION = d056efcc22fdf8a812af291d304b1b704f7a65a9
INTERLOCK_SITE = $(call github,inversepath,interlock,$(INTERLOCK_VERSION))
INTERLOCK_REPO = https://github.com/inversepath/interlock

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

ifeq ($(BR2_PACKAGE_INTERLOCK_TEXTSECURE),y)
INTERLOCK_MAKE_TARGET="with_textsecure"
else
INTERLOCK_MAKE_TARGET="build"
endif

define INTERLOCK_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(INTERLOCK_MAKE_TARGET) GOARCH=arm CC=$(TARGET_CC) CGO_ENABLED=1 BUILD=buildroot -C $(@D)
	mkdir -p $(TARGET_DIR)/usr/share/interlock
	cp -r $(@D)/static $(TARGET_DIR)/usr/share/interlock
	$(INSTALL) -m 0755 -D $(@D)/interlock $(TARGET_DIR)/usr/bin/interlock
endef

$(eval $(generic-package))
