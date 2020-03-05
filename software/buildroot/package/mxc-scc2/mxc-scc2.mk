################################################################################
#
# MXC_SCC2
#
################################################################################

MXC_SCC2_VERSION = 4bfa5252c2847c0c494491fcd8e79d8966726ad5
MXC_SCC2_SITE = $(call github,f-secure-foundry,mxc-scc2,$(MXC_SCC2_VERSION))
MXC_SCC2_REPO = https://github.com/f-secure-foundry/mxc-scc2

MXC_SCC2_LICENSE = GPLv3
MXC_SCC2_LICENSE_FILES = LICENSE

MXC_SCC2_DEPENDENCIES = linux

define MXC_SCC2_BUILD_CMDS
	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
endef

define MXC_SCC2_INSTALL_TARGET_CMDS
	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules_install
endef

$(eval $(generic-package))
