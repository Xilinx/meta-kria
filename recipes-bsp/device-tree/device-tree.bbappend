FILESEXTRAPATHS:prepend:k26 := "${THISDIR}/files:"

SRCREV_FORMAT:k26 = "device-tree"
SRC_URI:append:k26 = "git://github.com/Xilinx/u-boot-xlnx.git;protocol=https;branch=master;destsuffix=u-boot-xlnx;name=uboot"
SRCREV_uboot = "a6b25711343354515775151589d50fdc0d5e7b1c"

UBOOT_DTFILES_BUNDLE:k26 ?= "1"
UBOOT_DTFILE_PREFIX:k26 = "system"

do_configure:append:k26() {
    for dts in ${UBOOT_DT_FILES}; do
        cp ${WORKDIR}/u-boot-xlnx/arch/arm/dts/${dts} ${DT_FILES_PATH}
    done
}

SRC_URI:append:k26-som = "\
    file://system-user.dtsi \
    file://system-conf.dtsi \
    file://pl-custom.dtsi \
    "

YAML_CONSOLE_DEVICE_CONFIG:k26-som = "psu_uart_1"
YAML_MAIN_MEMORY_CONFIG:k26-som = "PSU_DDR_0"
YAML_ENABLE_NO_ALIAS:k26-som = "1"

DT_PADDING_SIZE:k26-som = "0x1000"
DTC_FLAGS:k26-som += "-@"
CUSTOM_PL_INCLUDE_DTSI:k26-som = "pl-custom.dtsi"

do_configure:append:k26-som() {
    echo '/include/ "system-user.dtsi"' >> ${DT_FILES_PATH}/system-top.dts
}
