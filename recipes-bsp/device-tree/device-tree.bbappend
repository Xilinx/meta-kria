DT_INCLUDE_KRIA:kria ?= " \
    ${@'${DT_FILES_PATH}/u-boot-xlnx/include/' if d.getVar('XILINX_WITH_ESW') == 'sdt' else ''} \
    ${@'${DT_FILES_PATH}/u-boot-xlnx/dts/upstream/include/' if d.getVar('XILINX_WITH_ESW') == 'sdt' else ''} \
    "

DT_INCLUDE:append = " ${DT_INCLUDE_KRIA}"

SRCREV_FORMAT:kria = "device-tree"
DT_UBOOT_BRANCH ?= "xlnx_rebase_v2026.01"
DT_UBOOT_SRCREV ?= "980da51527e0a9a7a79ac218347ade2bfd5bb330"
SRC_URI:append:kria = " git://github.com/Xilinx/u-boot-xlnx.git;protocol=https;branch=${DT_UBOOT_BRANCH};destsuffix=u-boot-xlnx;name=uboot"
SRCREV_uboot = "${DT_UBOOT_SRCREV}"

# Track SDT artifacts for base DTS provenance (filename + sha256, not full URI)
# (DT_UBOOT_* already tracked via base recipe's MANIFEST_BRANCH_VARS/MANIFEST_SRCREV_VARS)
MANIFEST_COMPONENT_FIELDS:append:kria = " sdt_file sdt_sha256"
MANIFEST_COMPONENT_FIELD_sdt_file:kria = "${@os.path.basename(d.getVar('SDT_URI') or '')}"
MANIFEST_COMPONENT_FIELD_sdt_sha256:kria = "${@d.getVarFlag('SDT_URI', 'sha256sum') or ''}"

UBOOT_DTFILES_BUNDLE:kria:linux ?= "1"
UBOOT_DTFILE_PREFIX:kria ?= "SMK"

do_configure:append:kria:linux() {
    for dts in ${UBOOT_DT_FILES}; do
        cp ${WORKDIR}/u-boot-xlnx/arch/arm/dts/${dts} ${DT_FILES_PATH}
    done
}

YAML_CONSOLE_DEVICE_CONFIG:kria = "psu_uart_1"
YAML_MAIN_MEMORY_CONFIG:kria = "PSU_DDR_0"
YAML_ENABLE_NO_ALIAS:kria = "1"

DT_PADDING_SIZE:kria = "0x1000"
DTC_FLAGS:kria += "-@"

do_install:append:kria() {
    # Remove dtbo files, these are no usable
    # keep pl.dtbo
    rm -f ${D}/boot/devicetree/zynqmp-sck*.dtbo
}
