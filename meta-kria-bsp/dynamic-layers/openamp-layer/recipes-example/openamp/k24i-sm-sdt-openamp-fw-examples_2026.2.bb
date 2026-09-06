SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria K24 industrial SOM"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria K24 industrial SOM."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k24i-sm-sdt_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/09060734/external/openamp-zephyr-demo/k24i-sm-sdt_openamp-zephyr-demo_09060734.tar.gz"
SRC_URI[sha256sum] = "a67c6637db7b6c67ee5b7051fec23b6727eb23e6810979f93da8a263de476698"

OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
