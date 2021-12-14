DESCRIPTION = "Init script to update MAC address by getting \
		the information  using fru_print application"
SUMMARY = "Init script to update MAC address by getting \
		the information using fru_print application and \
		this applicable for SOM devices"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://update-misc-config.sh"

inherit update-rc.d

RDEPENDS:${PN} += "fru-print python3"

INSANE_SKIP:${PN} += "installed-vs-shipped"

INITSCRIPT_NAME = "update-misc-config.sh"
INITSCRIPT_PARAMS = "start 99 S ."

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:k26 = "${MACHINE}"

do_install () {
    install -d ${D}${sysconfdir}/init.d/
    install -m 0755 ${WORKDIR}/update-misc-config.sh ${D}${sysconfdir}/init.d/

    if [ "${INITRAMFS_IMAGE}" = "petalinux-initramfs-image" ]; then
	install -d ${D}/exec.d/
	install -m 0755 ${WORKDIR}/update-misc-config.sh ${D}/exec.d/
    fi
}

FILES:${PN} = "${sysconfdir}/init.d/update-misc-config.sh /exec.d/update-misc-config.sh"
