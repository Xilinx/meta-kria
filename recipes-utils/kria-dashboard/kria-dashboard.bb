SUMMARY = "kria-dashboard including dashboard and daemon"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=2fad2ef643ccf9eb1427b00a4eb5a445"
BRANCH ?= "xlnx_rel_v2022.1"
SRC_URI = "git://github.com/Xilinx/kria-dashboard.git;protocol=https;branch=${BRANCH}"
SRCREV ?= "a57cb7bffa4712170bba82bc56fcc24283aecbac"

S = "${WORKDIR}/git"

PROVIDES += "som-dashboard"

SRC_URI:append = " \
	file://kria-dashboard.service \
	file://kria-dashboard.sh \
	"

RDEPENDS:${PN} += " \
	bash \
	dfx-mgr \
	python3-bokeh \
	python3 \
	xlnx-platformstats-python \
	"
inherit python3-dir
inherit update-rc.d systemd

do_configure[noexec]="1"
do_compile[noexec]="1"

INITSCRIPT_NAME = "kria-dashboard"
INITSCRIPT_PARAMS = "start 98 3 5 . stop 20 0 1 2 6 ."

SYSTEMD_PACKAGES="${PN}"
SYSTEMD_SERVICE:${PN}="kria-dashboard.service"
SYSTEMD_AUTO_ENABLE:${PN}="enable"

do_install() {
	install -d ${D}${PYTHON_SITEPACKAGES_DIR}
	install -d ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}
	cp -r ${S}/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}/
	cp -r ${S}/templates ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}/

        if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
	      install -d ${D}${sysconfdir}/init.d
	      install -m 0755 ${S}/kria-dashboard ${D}${sysconfdir}/init.d/kria-dashboard
	fi

     install -d ${D}${bindir}
     install -m 0755 ${WORKDIR}/kria-dashboard.sh ${D}${bindir}/kria-dashboard.sh
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 ${WORKDIR}/kria-dashboard.service ${D}${systemd_system_unitdir}

}

FILES:${PN} += "\
		${systemd_system_unitdir}\
		${PYTHON_SITEPACKAGES_DIR}\
		"
RREPLACES:${PN} = "som-dashboard"
