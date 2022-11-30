DESCRIPTION = "xmutil"

RDEPENDS:${PN} = " \
	python3-core \
	python3-distro \
	freeipmi \
	dfx-mgr \
	xlnx-platformstats \
	axi-qos \
	ddr-qos \
	image-update \
	kria-pwrctl \
	"

inherit python3-dir autotools-brokensep

require xmutil-2023.1.inc

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:zynqmp = "zynqmp"
COMPATIBLE_MACHINE:versal = "versal"

BRANCHARG = "${@['nobranch=1', 'branch=${BRANCH}'][d.getVar('BRANCH', True) != '']}"
S = "${WORKDIR}/git"

SRC_URI="${REPO};${BRANCHARG}"

FILES:${PN} += "${bindir}/xmutil"
