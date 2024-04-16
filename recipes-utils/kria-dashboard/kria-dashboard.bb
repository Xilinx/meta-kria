SUMMARY = "kria-dashboard including dashboard and daemon"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=2fad2ef643ccf9eb1427b00a4eb5a445"
BRANCH ?= "xlnx_rel_v2024.1"
SRC_URI = "git://github.com/Xilinx/kria-dashboard.git;protocol=https;branch=${BRANCH}"
SRCREV ?= "550a59619ad63b9d4bf1ebc7c31988862e4fa0ea"

S = "${WORKDIR}/git"

PROVIDES += "som-dashboard"

RDEPENDS:${PN} += " \
	bash \
	dfx-mgr \
	python3-bokeh \
	python3 \
	xlnx-platformstats-python \
	"
inherit python3-dir systemd

do_configure[noexec]="1"
do_compile[noexec]="1"

SYSTEMD_PACKAGES="${PN}"
SYSTEMD_SERVICE:${PN}="kria-dashboard.service"
SYSTEMD_AUTO_ENABLE:${PN}="enable"

do_install() {
	install -d ${D}${PYTHON_SITEPACKAGES_DIR}
	install -d ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}
	cp -r ${S}/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}/
	cp -r ${S}/templates ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}/

	install -d ${D}${bindir}
	install -m 0755 ${S}/kria-dashboard.sh ${D}${bindir}/kria-dashboard.sh
	install -d ${D}${systemd_system_unitdir}
	install -m 0644 ${S}/kria-dashboard.service ${D}${systemd_system_unitdir}
}

FILES:${PN} += "\
		${systemd_system_unitdir}\
		${PYTHON_SITEPACKAGES_DIR}\
		"
RREPLACES:${PN} = "som-dashboard"
