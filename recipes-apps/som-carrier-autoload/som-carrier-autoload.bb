DESCRIPTION = "Init script to load the carrier card dtbo by getting \
		the information  using fru_print application"
SUMMARY = "Init script to load the carrier card dtbo by getting \
		the information using fru_print application and \
		this applicable for SOM devices"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://som-carrier-autoload.sh"

inherit update-rc.d

RDEPENDS_${PN} += "fru-print python3"

INSANE_SKIP_${PN} += "installed-vs-shipped"

INITSCRIPT_NAME = "som-carrier-autoload.sh"
INITSCRIPT_PARAMS = "start 99 S ."

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE_k26 = "${MACHINE}"

do_install () {
    install -d ${D}${sysconfdir}/init.d/
    install -m 0755 ${WORKDIR}/som-carrier-autoload.sh ${D}${sysconfdir}/init.d/

    if [ "${INITRAMFS_IMAGE}" = "petalinux-initramfs-image" ]; then
	install -d ${D}/exec.d/
	install -m 0755 ${WORKDIR}/som-carrier-autoload.sh ${D}/exec.d/
    fi
}

FILES_${PN} = "${sysconfdir}/init.d/som-carrier-autoload.sh /exec.d/som-carrier-autoload.sh"
