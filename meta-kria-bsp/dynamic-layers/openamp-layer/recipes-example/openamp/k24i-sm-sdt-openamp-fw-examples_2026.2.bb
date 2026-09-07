SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria K24 industrial SOM"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria K24 industrial SOM."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k24i-sm-sdt_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/09070710/external/openamp-zephyr-demo/k24i-sm-sdt_openamp-zephyr-demo_09070710.tar.gz"
SRC_URI[sha256sum] = "6ff690d86dcc04583857cb6749844cc8057f66d410dd815318c61807811c64a7"

OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
