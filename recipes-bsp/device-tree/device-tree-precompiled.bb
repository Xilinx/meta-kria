SUMMARY = "AMD BSP precompiled device trees"
DESCRIPTION = "AMD BSP precompiled device trees for Kria image"
SECTION = "bsp"

LICENSE = "MIT"
LIC_FILES_CHKSUM = " file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 "

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:kria-zynqmp-generic = "kria-zynqmp-generic"

PROVIDES = "virtual/dtb"

inherit deploy

PRECOMPILED_DTB_FILES_DIR ?= ""

do_install () {
    if [ -z "${PRECOMPILED_DTB_FILES_DIR}" ]; then
        bberror "PRECOMPILED_DTB_FILES_DIR not defined"
    fi

    install -d ${D}/boot/devicetree/
    for dtb in ${PRECOMPILED_DTB_FILES_DIR}/*.dtb; do
        install -m 0644 ${dtb} ${D}/boot/devicetree/
    done
}

do_deploy () {
    install -d ${DEPLOYDIR}/devicetree/
    for dtb in ${PRECOMPILED_DTB_FILES_DIR}/*.dtb; do
        install -m 0644 ${dtb} ${DEPLOYDIR}/devicetree/
    done
}

addtask deploy before after do_install

FILES:${PN} = "/boot/devicetree/*.dtb"
