SUMMARY = "Xilinx EEPROM blobs"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e02145ed27d5ba38507cf0f17e27adf0"

BRANCH ?= "xlnx_rel_v2024.1"
SRC_URI = "git://github.com/Xilinx/xlnx-board-id-data.git;protocol=https;branch=${BRANCH}"
SRCREV ?= "b2ae845b7b1b24f82a9410c2db5bc2eae5b4a545"

S = "${WORKDIR}/git"

COMPATIBLE_MACHINE = "^$"

PACKAGE_ARCH = "${MACHINE_ARCH}"

require board-id-k26.inc
require board-id-k24.inc

inherit deploy

do_configure[noexec] = "1"
do_compile[noexec] = "1"
do_install[noexec] = "1"

# Don't generate packages, this only gets deployed
PACKAGES = ""

# Each board should provide the SOM_EEPROM and CC_EEPROM files
PATH_EEPROM ?= "none"
SOM_EEPROM ?= "none"
CC_EEPROM ?= "none"

DEPLOY_SUFFIX = "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"

do_deploy() {
	if [ -e ${S}/${PATH_EEPROM}/${SOM_EEPROM} ]; then
		install -Dm 0644 ${S}/${PATH_EEPROM}/${SOM_EEPROM} ${DEPLOYDIR}/som-eeprom-${DEPLOY_SUFFIX}.bin
		ln -sf som-eeprom-${DEPLOY_SUFFIX}.bin ${DEPLOYDIR}/som-eeprom.bin
	else
		bbwarn "No SOM eeprom found."
	fi
	for eeprom in ${CC_EEPROM}; do
		install -Dm 0644 ${S}/${PATH_EEPROM}/${eeprom} ${DEPLOYDIR}/${eeprom%%.bin}-${DEPLOY_SUFFIX}.bin
		ln -sf ${eeprom%%.bin}-${DEPLOY_SUFFIX}.bin ${DEPLOYDIR}/${eeprom}
	done
}

addtask deploy before do_build after do_install
