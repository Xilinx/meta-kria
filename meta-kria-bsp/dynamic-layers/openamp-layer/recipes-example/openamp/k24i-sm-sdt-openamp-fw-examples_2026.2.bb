SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria K24 industrial SOM"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria K24 industrial SOM."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k24i-sm-sdt_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/10030743/external/openamp-zephyr-demo/k24i-sm-sdt_openamp-zephyr-demo_10030743.tar.gz"
SRC_URI[sha256sum] = "fe8f5f828f026cd05c4e7fa6f74c67e78366b5f7ad2a25055f82d60d611a5276"

OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
