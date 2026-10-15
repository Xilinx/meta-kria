SUMMARY = "AMD Xilinx Kria management utility (xmutil) command-line \
tool."
DESCRIPTION = "Command-line tool that loads and unloads accelerated \
applications, manages firmware slots, and queries SOM/board status on \
AMD Kria SOM platforms."
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://MIT;md5=10e38f7eeaea9c7c18447b42d987003f"

REPO = "git://github.com/Xilinx/xmutil.git;protocol=https"
SRCREV = "da03e2ee299331af90025744363c3ce7780f920f"
PV .= "+git"

BRANCH = "master"
BRANCHARG = "${@['nobranch=1', 'branch=${BRANCH}'][d.getVar('BRANCH') != '']}"
SRC_URI = "${REPO};${BRANCHARG}"

RDEPENDS:${PN} = " \
	python3-core \
	python3-distro \
	python3-periphery \
	freeipmi \
	dfx-mgr \
	xlnx-platformstats \
	axi-qos \
	ddr-qos \
	image-update \
	"

inherit python3-dir

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:zynqmp = "zynqmp"
COMPATIBLE_MACHINE:versal = "versal"
COMPATIBLE_MACHINE:versal-net = "versal-net"

RREPLACES:${PN} = "kria-pwrctl"

FILES:${PN} += "${bindir}/xmutil"

do_install() {
	oe_runmake install DESTDIR=${D}
}
