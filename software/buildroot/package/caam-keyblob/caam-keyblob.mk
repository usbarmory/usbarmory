################################################################################
#
# CAAM_KEYBLOB
#
################################################################################

CAAM_KEYBLOB_VERSION = ecc82198c2f8c9f873e14d6dc9212fda6691f8bf
CAAM_KEYBLOB_SITE = $(call github,inversepath,caam-keyblob,$(CAAM_KEYBLOB_VERSION))

CAAM_KEYBLOB_LICENSE = GPLv3
CAAM_KEYBLOB_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
