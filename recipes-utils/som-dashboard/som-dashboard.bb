SUMMARY = "som-dashboard including dashboard and daemon"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=2fad2ef643ccf9eb1427b00a4eb5a445"
BRANCH ?= "xlnx_rel_v2022.1"
SRC_URI = "git://github.com/Xilinx/SOM-Dashboard.git;protocol=https;branch=${BRANCH}"
SRCREV ?= "a24ad313772407bb50c3e81a4bd9686b81202a0b"

S = "${WORKDIR}/git"

SRC_URI:append = " \
	file://som-dashboard.service \
	file://som-dashboard.sh \
	"

RDEPENDS:${PN} += " \
	bash \
	dfx-mgr \
	python3-bokeh \
	python3 \
	"
inherit python3-dir
inherit update-rc.d systemd

do_configure[noexec]="1"
do_compile[noexec]="1"

INITSCRIPT_NAME = "som-dashboard-init"
INITSCRIPT_PARAMS = "start 98 3 5 . stop 20 0 1 2 6 ."

SYSTEMD_PACKAGES="${PN}"
SYSTEMD_SERVICE:${PN}="som-dashboard.service"
SYSTEMD_AUTO_ENABLE:${PN}="enable"

do_install() {
	install -d ${D}${PYTHON_SITEPACKAGES_DIR}
	install -d ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}
	cp -r ${S}/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}/
	cp -r ${S}/templates ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}/

        if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
	      install -d ${D}${sysconfdir}/init.d
	      install -m 0755 ${S}/som-dashboard-init ${D}${sysconfdir}/init.d/som-dashboard-init
	fi

     install -d ${D}${bindir}
     install -m 0755 ${WORKDIR}/som-dashboard.sh ${D}${bindir}/som-dashboard.sh
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 ${WORKDIR}/som-dashboard.service ${D}${systemd_system_unitdir}

}

FILES:${PN} += "\
		${systemd_system_unitdir}\
		${PYTHON_SITEPACKAGES_DIR}\
		"
