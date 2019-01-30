################################################################################
#
# CAAM_KEYBLOB
#
################################################################################

CAAM_KEYBLOB_VERSION = 6500c585bd81dac71c09627167b657cf66999f4d
CAAM_KEYBLOB_SITE = $(call github,inversepath,caam-keyblob,$(CAAM_KEYBLOB_VERSION))

CAAM_KEYBLOB_LICENSE = GPLv3
CAAM_KEYBLOB_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
