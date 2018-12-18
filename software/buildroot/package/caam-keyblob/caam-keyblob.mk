################################################################################
#
# CAAM_KEYBLOB
#
################################################################################

CAAM_KEYBLOB_VERSION = 581e55f6d67e8d3a7734b9a83d6eac571db51a3c
CAAM_KEYBLOB_SITE = $(call github,inversepath,caam-keyblob,$(CAAM_KEYBLOB_VERSION))

CAAM_KEYBLOB_LICENSE = GPLv3
CAAM_KEYBLOB_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
