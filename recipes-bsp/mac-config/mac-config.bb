DESCRIPTION = "Init script to update MAC address"
SUMMARY = "Init script for Kria SOM to update MAC address using ipmi_fru"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = " \
    file://update-mac-config.sh \
    file://update-mac-config.service \
"

inherit update-rc.d systemd

RDEPENDS:${PN} += "freeipmi python3"

INSANE_SKIP:${PN} += "installed-vs-shipped"

INITSCRIPT_NAME = "update-mac-config.sh"
INITSCRIPT_PARAMS = "start 99 S ."

SYSTEMD_PACKAGES="${PN}"
SYSTEMD_SERVICE:${PN}="update-mac-config.service"
SYSTEMD_AUTO_ENABLE:${PN}="enable"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:kria = "${MACHINE}"

do_install () {

    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
        install -d ${D}${sysconfdir}/init.d/
        install -m 0755 ${WORKDIR}/update-mac-config.sh ${D}${sysconfdir}/init.d/
    fi

    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/update-mac-config.sh ${D}${bindir}/
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/update-mac-config.service ${D}${systemd_system_unitdir}

    install -d ${D}/exec.d/
    install -m 0755 ${WORKDIR}/update-mac-config.sh ${D}/exec.d/
}

FILES:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','${sysconfdir}/init.d/update-mac-config.sh', '', d)} /exec.d/update-mac-config.sh"
