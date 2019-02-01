#!/bin/sh

SCC2_DT=${BINARIES_DIR}/imx53-usbarmory-scc2.dtb

if [ -f ${SCC2_DT} ]; then
	mv ${SCC2_DT} ${BINARIES_DIR}/imx53-usbarmory.dtb
fi
