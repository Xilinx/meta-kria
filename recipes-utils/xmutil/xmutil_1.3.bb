DESCRIPTION = "xmutil"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://MIT;md5=10e38f7eeaea9c7c18447b42d987003f"

REPO = "git://github.com/Xilinx/xmutil.git;protocol=https"
SRCREV = "51510bb0fd7d586841709a49c493fe3398bd2d2c"
PV .= "+git"

BRANCH = "master"
BRANCHARG = "${@['nobranch=1', 'branch=${BRANCH}'][d.getVar('BRANCH', True) != '']}"
SRC_URI="${REPO};${BRANCHARG}"

S = "${WORKDIR}/git"

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

inherit python3-dir autotools-brokensep

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:zynqmp = "zynqmp"
COMPATIBLE_MACHINE:versal = "versal"
COMPATIBLE_MACHINE:versal-net = "versal-net"

RREPLACES:${PN} = "kria-pwrctl"

FILES:${PN} += "${bindir}/xmutil"
