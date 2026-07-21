BOOTBIN_INCLUDE:kria = "xilinx-bootbin-kria.inc"

include ${BOOTBIN_INCLUDE}

# Avoid EDF specific circular dependencies
EXTRA_IMAGEDEPENDS:remove = "kria-qspi"
