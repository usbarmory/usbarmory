################################################################################
#
# CAAM_KEYBLOB
#
################################################################################

CAAM_KEYBLOB_VERSION = 96debce62ac102d3f79cba185e4ea629cf1c14e5
CAAM_KEYBLOB_SITE = $(call github,f-secure-foundry,caam-keyblob,$(CAAM_KEYBLOB_VERSION))

CAAM_KEYBLOB_LICENSE = GPLv3
CAAM_KEYBLOB_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
