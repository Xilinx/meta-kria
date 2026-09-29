SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria K24 industrial SOM"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria K24 industrial SOM."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k24i-sm-sdt_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/09290125/external/openamp-zephyr-demo/k24i-sm-sdt_openamp-zephyr-demo_09290125.tar.gz"
SRC_URI[sha256sum] = "d131068f1f4cb79c14325c0c23d39bc315dedd5a4989fc318214bb701c32cccc"

OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
