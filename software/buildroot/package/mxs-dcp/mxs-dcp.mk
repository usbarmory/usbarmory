################################################################################
#
# MXS_DCP
#
################################################################################

MXS_DCP_VERSION = 4f11eaf0b8c0d80b181a559cc13b1582bec8f171
MXS_DCP_SITE = $(call github,f-secure-foundry,mxs-dcp,$(MXS_DCP_VERSION))
MXS_DCP_REPO = https://github.com/f-secure-foundry/mxs-dcp

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
