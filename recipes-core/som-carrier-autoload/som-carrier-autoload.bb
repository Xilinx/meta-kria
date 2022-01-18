DESCRIPTION = "Init script to load the carrier card dtbo by getting \
		the information  using fru_print application"
SUMMARY = "Init script to load the carrier card dtbo by getting \
		the information using fru_print application and \
		this applicable for SOM devices"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = " \
	file://som-carrier-autoload.sh \
	file://som-carrier-autoload.service \
"

inherit update-rc.d systemd

RDEPENDS:${PN} += "fru-print python3"

INSANE_SKIP:${PN} += "installed-vs-shipped"

INITSCRIPT_NAME = "som-carrier-autoload.sh"
INITSCRIPT_PARAMS = "start 99 S ."

SYSTEMD_PACKAGES="${PN}"
SYSTEMD_SERVICE:${PN}="som-carrier-autoload.service"
SYSTEMD_AUTO_ENABLE:${PN}="enable"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:k26 = "${MACHINE}"

do_install () {

    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
    	install -d ${D}${sysconfdir}/init.d/
    	install -m 0755 ${WORKDIR}/som-carrier-autoload.sh ${D}${sysconfdir}/init.d/
    fi

    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/som-carrier-autoload.sh ${D}${bindir}/
    install -d ${D}${systemd_system_unitdir} 
    install -m 0644 ${WORKDIR}/som-carrier-autoload.service ${D}${systemd_system_unitdir}


    if [ "${INITRAMFS_IMAGE}" = "petalinux-initramfs-image" ]; then
	install -d ${D}/exec.d/
	install -m 0755 ${WORKDIR}/som-carrier-autoload.sh ${D}/exec.d/
    fi
}

FILES:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','${sysconfdir}/init.d/som-carrier-autoload.sh', '', d)} /exec.d/som-carrier-autoload.sh"
