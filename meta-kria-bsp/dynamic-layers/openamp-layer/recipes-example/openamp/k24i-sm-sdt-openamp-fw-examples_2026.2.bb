SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria K24 industrial SOM"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria K24 industrial SOM."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k24i-sm-sdt_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/09270540/external/openamp-zephyr-demo/k24i-sm-sdt_openamp-zephyr-demo_09270540.tar.gz"
SRC_URI[sha256sum] = "ce0e298acc084c956e8a06bf8261f0b489ded9db9f3611f161587efe4bd35252"

OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
