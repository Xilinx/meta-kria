require xilinx-bootbin-version.inc

# remove "-multidomain" suffix from multidomain machine names.
BOOTBIN_VERSION_MACHINE:kria = "${@d.getVar('MACHINE').replace('-multidomain', '')}"
BOOTBIN_VERSION_STRING:kria ?= "${BOOTBIN_VERSION_MACHINE}-v${BOOTBIN_VER_MAIN}${IMAGE_VERSION_SUFFIX}"
