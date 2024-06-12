DESCRIPTION = "Generate a QSPI image for the Kria SOM platform"
SUMMARY = "QSPI image includes image selectors, various registers, A/B images and recovery images"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS = "virtual/imgsel virtual/imgrcry virtual/boot-bin virtual/fsbl"

inherit deploy image-artifact-names amd_spi_image

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:k26-sm = "${MACHINE}"
COMPATIBLE_MACHINE:k26-smk = "${MACHINE}"
COMPATIBLE_MACHINE:k24-sm = "${MACHINE}"
COMPATIBLE_MACHINE:k24-smk = "${MACHINE}"

QSPI_IMAGE_NAME = "XilinxSom_QspiImage"

QSPI_IMAGE_VERSION ?= ""
QSPI_IMAGE_VERSION:k26-kria = "2.1"
QSPI_IMAGE_VERSION:k24-kria = "1.1"

do_manifest () {
    printf "=== QSPI\nVERSION: ${QSPI_IMAGE_VERSION}\n\n" > ${B}/${IMAGE_NAME}.manifest
    cat ${DEPLOY_DIR_IMAGE}/imgrcry-${MACHINE}.manifest >> ${B}/${IMAGE_NAME}.manifest
    cat ${DEPLOY_DIR_IMAGE}/imgsel-${MACHINE}.manifest >> ${B}/${IMAGE_NAME}.manifest
    printf "=== BOOT.BIN\n" >> ${B}/${IMAGE_NAME}.manifest
    cat ${DEPLOY_DIR_IMAGE}/boot.bin.manifest >> ${B}/${IMAGE_NAME}.manifest
}

do_deploy () {
    install -Dm 644 ${B}/${IMAGE_NAME}.bin ${DEPLOYDIR}/${IMAGE_NAME}.bin
    ln -s ${IMAGE_NAME}.bin ${DEPLOYDIR}/${IMAGE_LINK_NAME}.bin
    ln -s ${IMAGE_NAME}.bin ${DEPLOYDIR}/${PN}-${MACHINE}-v${QSPI_IMAGE_VERSION}.bin

    install -Dm 644 ${B}/${IMAGE_NAME}.manifest ${DEPLOYDIR}/${IMAGE_NAME}.manifest
    ln -s ${IMAGE_NAME}.manifest ${DEPLOYDIR}/${IMAGE_LINK_NAME}.manifest
}

addtask manifest after do_compile
addtask deploy after do_manifest
