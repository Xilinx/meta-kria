SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria K24 commercial SOM"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria K24 commercial SOM."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k24c-sm-sdt_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/09060734/external/openamp-zephyr-demo/k24c-sm-sdt_openamp-zephyr-demo_09060734.tar.gz"
SRC_URI[sha256sum] = "a74fac7b492d77dd8e8aad64127ad29b1ffcea05d07081dee0012509de1295fc"

OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
