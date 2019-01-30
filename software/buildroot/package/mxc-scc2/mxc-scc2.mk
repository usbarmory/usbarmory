################################################################################
#
# MXC_SCC2
#
################################################################################

MXC_SCC2_VERSION = 258a0a55294d9c63347061fb238c2d99036a05cf
MXC_SCC2_SITE = $(call github,inversepath,mxc-scc2,$(MXC_SCC2_VERSION))
MXC_SCC2_REPO = https://github.com/inversepath/mxc-scc2

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
