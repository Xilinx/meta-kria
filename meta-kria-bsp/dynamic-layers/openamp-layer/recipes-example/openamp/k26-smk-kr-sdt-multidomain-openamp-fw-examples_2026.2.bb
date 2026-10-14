SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria KR260 starter kit"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria KR260 starter kit."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k26-smk-kr-sdt-multidomain_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/10140754/external/openamp-zephyr-demo/k26-smk-kr-sdt-multidomain_openamp-zephyr-demo_10140754.tar.gz"
SRC_URI[sha256sum] = "8ef4b061f2c2ca41a43331bff51e1647df1f755c8fa3e0abe78b1c2a3f539da2"

OPENAMPFW_BOARD = "kr260"
OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
