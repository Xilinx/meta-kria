FILESEXTRAPATHS:prepend:k26 := "${THISDIR}/files:"

SRC_URI:append:k26 = " file://openamp.dtsi "

do_configure:append:k26() {
     if [ -e ${WORKDIR}/openamp.dtsi ]; then
	     sed -i '/openamp\.dtsi/d' ${DT_FILES_PATH}/system-top.dts
	     echo '/include/ "openamp.dtsi"' >> ${DT_FILES_PATH}/system-top.dts
     fi
}

SRC_URI:append:k26-som = "file://system-user.dtsi file://system-conf.dtsi"

YAML_CONSOLE_DEVICE_CONFIG:k26-som = "psu_uart_1"
YAML_MAIN_MEMORY_CONFIG:k26-som = "PSU_DDR_0"
YAML_ENABLE_NO_ALIAS:k26-som = "1"

DT_PADDING_SIZE:k26-som = "0x1000"
DTC_FLAGS:k26-som += "-@"

SRC_URI:append:k26-som = " file://pl-custom.dtsi "
CUSTOM_PL_INCLUDE_DTSI:k26-som = "pl-custom.dtsi"

do_configure:append:k26-som() {
    echo '/include/ "system-user.dtsi"' >> ${DT_FILES_PATH}/system-top.dts
}

#FIXME These appear to be installed in both the initramfs and rootfs
EXTRA_DT_FILES:kv260-starter-kit += "\
    zynqmp-sck-kr-g-revA.dts \
    zynqmp-sck-kv-g-rev1.dts \
    zynqmp-sck-kv-g-revA.dts \
    zynqmp-sck-kv-g-revB.dts \
    zynqmp-sck-kv-g-revQEMU.dts \
    zynqmp-sck-kv-g-revZ.dts \
    "
