SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria K24 commercial SOM"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria K24 commercial SOM."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k24c-sm-sdt_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/10160545/external/openamp-zephyr-demo/k24c-sm-sdt_openamp-zephyr-demo_10160545.tar.gz"
SRC_URI[sha256sum] = "8e5ed102c8c1b108ea9d3d2c2c7cb24d7fa64e4f4076f43c2a640ca5ad3abe68"

OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
