SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria KR260 starter kit"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria KR260 starter kit."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k26-smk-kr-sdt-multidomain_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/10180550/external/openamp-zephyr-demo/k26-smk-kr-sdt-multidomain_openamp-zephyr-demo_10180550.tar.gz"
SRC_URI[sha256sum] = "671a093ff98040e328ca02a57c3c110090224735032ff174a72cd990c9dee5ed"

OPENAMPFW_BOARD = "kr260"
OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
