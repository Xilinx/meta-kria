require xilinx-bootbin-version.inc

# remove "-multidomain" suffix from multidomain machine names.
BOOTBIN_VERSION_MACHINE:kria = "${@d.getVar('MACHINE').replace('-multidomain', '')}"
