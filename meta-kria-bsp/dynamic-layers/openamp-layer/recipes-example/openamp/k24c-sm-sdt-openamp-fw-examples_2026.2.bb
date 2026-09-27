SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria K24 commercial SOM"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria K24 commercial SOM."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k24c-sm-sdt_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/09270540/external/openamp-zephyr-demo/k24c-sm-sdt_openamp-zephyr-demo_09270540.tar.gz"
SRC_URI[sha256sum] = "1c5ae3b7a0dac21371c6741742e26da5a238f6d4c9988be37b752d2296979be5"

OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
