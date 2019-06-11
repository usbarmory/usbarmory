################################################################################
#
# MXS_DCP
#
################################################################################

MXS_DCP_VERSION = 9280f2b3e7a66d9bac277cb21e6896b82505a4df
MXS_DCP_SITE = $(call github,inversepath,mxs-dcp,$(MXS_DCP_VERSION))
MXS_DCP_REPO = https://github.com/inversepath/mxs-dcp

MXS_DCP_LICENSE = GPLv3
MXS_DCP_LICENSE_FILES = LICENSE

MXS_DCP_DEPENDENCIES = linux

define MXS_DCP_BUILD_CMDS
	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
endef

define MXS_DCP_INSTALL_TARGET_CMDS
	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules_install
endef

$(eval $(generic-package))
