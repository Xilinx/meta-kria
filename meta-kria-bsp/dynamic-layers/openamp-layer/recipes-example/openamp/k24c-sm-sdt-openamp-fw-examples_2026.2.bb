SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria K24 commercial SOM"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria K24 commercial SOM."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k24c-sm-sdt_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/09070710/external/openamp-zephyr-demo/k24c-sm-sdt_openamp-zephyr-demo_09070710.tar.gz"
SRC_URI[sha256sum] = "346b0103c296b9fe6384649c51cbd3a38a6aef8e8424f8bf9b5331f44b210944"

OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
