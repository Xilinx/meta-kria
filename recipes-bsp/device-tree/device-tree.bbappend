FILESEXTRAPATHS:prepend:k26 := "${THISDIR}/files:"
FILESEXTRAPATHS:prepend:k26-starter-kit := "${THISDIR}/k26:"
FILESEXTRAPATHS:prepend:kv260-starter-kit := "${THISDIR}/kv260:"
FILESEXTRAPATHS:prepend:kr260-starter-kit := "${THISDIR}/kr260:"

SRCREV_FORMAT:k26 = "device-tree"
SRC_URI:append:k26 = " git://github.com/Xilinx/u-boot-xlnx.git;protocol=https;branch=xlnx_rebase_v2022.01;destsuffix=u-boot-xlnx;name=uboot"
SRCREV_uboot = "b31476685debf5512ed0d4e8000fa5167a22f530"

UBOOT_DTFILES_BUNDLE:k26 ?= "1"
UBOOT_DTFILE_PREFIX:k26 = "SMK"

do_configure:append:k26() {
    for dts in ${UBOOT_DT_FILES}; do
        cp ${WORKDIR}/u-boot-xlnx/arch/arm/dts/${dts} ${DT_FILES_PATH}
    done
}

SRC_URI:append:k26-som = " file://pl-custom.dtsi "
SRC_URI:append:k26-starter-kit = " file://system-user.dtsi file://system-conf.dtsi "
SRC_URI:append:kv260-starter-kit = " file://system-user.dtsi file://system-conf.dtsi "
SRC_URI:append:kr260-starter-kit = " file://system-user.dtsi file://system-conf.dtsi "

YAML_CONSOLE_DEVICE_CONFIG:k26-som = "psu_uart_1"
YAML_MAIN_MEMORY_CONFIG:k26-som = "PSU_DDR_0"
YAML_ENABLE_NO_ALIAS:k26-som = "1"

DT_PADDING_SIZE:k26-som = "0x1000"
DTC_FLAGS:k26-som += "-@"
CUSTOM_PL_INCLUDE_DTSI:k26-som = "pl-custom.dtsi"

do_configure:append:k26-starter-kit() {
    echo '/include/ "system-user.dtsi"' >> ${DT_FILES_PATH}/system-top.dts
}
do_configure:append:kv260-starter-kit() {
    echo '/include/ "system-user.dtsi"' >> ${DT_FILES_PATH}/system-top.dts
}
do_configure:append:kr260-starter-kit() {
    echo '/include/ "system-user.dtsi"' >> ${DT_FILES_PATH}/system-top.dts
}
