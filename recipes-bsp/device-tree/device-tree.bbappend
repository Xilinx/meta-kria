FILESEXTRAPATHS:prepend:k26 := "${THISDIR}/files:"

SRC_URI:append:k26 = " file://openamp.dtsi "

do_configure:append:k26() {
     if [ -e ${WORKDIR}/openamp.dtsi ]; then
	 sed -i '/openamp\.dtsi/d' ${DT_FILES_PATH}/system-top.dts
	 echo '/include/ "openamp.dtsi"' >> ${DT_FILES_PATH}/system-top.dts
     fi
}
