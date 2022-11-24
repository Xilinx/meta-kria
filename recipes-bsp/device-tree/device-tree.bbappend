FILESEXTRAPATHS:prepend:kria := "${THISDIR}/k26-som:"

SRCREV_FORMAT:kria = "device-tree"
SRC_URI:append:kria = " git://github.com/Xilinx/u-boot-xlnx.git;protocol=https;branch=master;destsuffix=u-boot-xlnx;name=uboot"
SRCREV_uboot = "fea1a1263e81f928d4c9a3a29f6e5b475ed1fb43"

UBOOT_DTFILES_BUNDLE:kria ?= "1"
UBOOT_DTFILE_PREFIX:kria = "SMK"

do_configure:append:kria() {
    for dts in ${UBOOT_DT_FILES}; do
        cp ${WORKDIR}/u-boot-xlnx/arch/arm/dts/${dts} ${DT_FILES_PATH}
    done
}

SRC_URI:append:kria = " file://pl-custom.dtsi file://system.dtsi "

YAML_CONSOLE_DEVICE_CONFIG:kria = "psu_uart_1"
YAML_MAIN_MEMORY_CONFIG:kria = "PSU_DDR_0"
YAML_ENABLE_NO_ALIAS:kria = "1"

DT_PADDING_SIZE:kria = "0x1000"
DTC_FLAGS:kria += "-@"
CUSTOM_PL_INCLUDE_DTSI:kria = "pl-custom.dtsi"

do_configure:append:kria() {
    echo '/include/ "system.dtsi"' >> ${DT_FILES_PATH}/system-top.dts
}
