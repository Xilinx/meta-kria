BIF_UDFBH_ATTR = "bootbin-version-header"

BIF_PARTITION_ATTR[bootbin-version-header] = "udf_bh"
BIF_PARTITION_IMAGE[bootbin-version-header] = "${RECIPE_SYSROOT}/boot/bootbin-version-header.txt"

BIF_PARTITION_ATTR[u-boot-xlnx-fit-blob] = "destination_cpu=a53-0,load=0x100000"
BIF_PARTITION_IMAGE[u-boot-xlnx-fit-blob] = "${RECIPE_SYSROOT}/boot/fit-dtb.blob"

BIF_PARTITION_ATTR:k26-kria = "${BIF_FSBL_ATTR} ${BIF_BITSTREAM_ATTR} ${BIF_ATF_ATTR} u-boot-xlnx-fit-blob ${BIF_SSBL_ATTR} bootbin-version-header"

BIF_PARTITION_ATTR:k24-kria = "${BIF_FSBL_ATTR} ${BIF_BITSTREAM_ATTR} ${BIF_ATF_ATTR} u-boot-xlnx-fit-blob ${BIF_SSBL_ATTR} bootbin-version-header"

BOOTBIN_MANIFEST_LAYERS ?= "meta-xilinx-standalone meta-xilinx-tools meta-kria"
BOOTBIN_MANIFEST_FILE ?= "boot.bin.manifest"

require xilinx-bootbin-version.inc

do_configure:append:kria() {
    revisions = oe.buildcfg.get_layer_revisions(d)
    layer_revs = {r[1]: r[3] for r in revisions}

    with open(d.expand("${B}/bootbin_yocto_layers.txt"), "w") as f:
        f.write("* Yocto Layers\n")
        for layer in d.getVar("BOOTBIN_MANIFEST_LAYERS").split():
            if layer in layer_revs:
                f.write(layer + " -> " + layer_revs[layer] + "\n")
}

ADDN_COMPILE_DEPENDS = ""
ADDN_COMPILE_DEPENDS:kria = "bootbin-version-header:do_deploy fsbl:do_deploy pmufw:do_deploy virtual/arm-trusted-firmware:do_deploy u-boot-xlnx:do_deploy device-tree:do_deploy"

do_compile[depends] += "${ADDN_COMPILE_DEPENDS}"
do_compile:append:kria() {
    bootbin_sha=$(sha1sum ${B}/BOOT.bin | cut -f 1 -d ' ')
    printf "SHA1: ${bootbin_sha}\n\n" > ${B}/${BOOTBIN_MANIFEST_FILE}

    cat ${DEPLOY_DIR_IMAGE}/bootbin-version-header-${MACHINE}.manifest \
        ${FSBL_DEPLOY_DIR}/fsbl-${MACHINE}.manifest ${PMU_FIRMWARE_DEPLOY_DIR}/pmu-firmware-${MACHINE}.manifest \
        ${DEPLOY_DIR_IMAGE}/arm-trusted-firmware.manifest ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.manifest \
        ${DEPLOY_DIR_IMAGE}/device-tree-${MACHINE}.manifest ${B}/bootbin_yocto_layers.txt >> ${B}/${BOOTBIN_MANIFEST_FILE}
}

do_deploy:append:kria() {
    install -m 0644 ${B}/${BOOTBIN_MANIFEST_FILE} ${DEPLOYDIR}/${BOOTBIN_BASE_NAME}.bin.manifest
    ln -sf ${BOOTBIN_BASE_NAME}.bin.manifest ${DEPLOYDIR}/${BOOTBIN_MANIFEST_FILE}

    ln -sf ${BOOTBIN_BASE_NAME}.bin ${DEPLOYDIR}/${@d.getVar("MACHINE")}-${BOOTBIN_VER_MAIN}${IMAGE_VERSION_SUFFIX}.bin
}
