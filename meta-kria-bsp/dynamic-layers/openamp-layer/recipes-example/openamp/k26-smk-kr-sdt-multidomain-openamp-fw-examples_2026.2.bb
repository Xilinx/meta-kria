SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria KR260 starter kit"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria KR260 starter kit."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k26-smk-kr-sdt-multidomain_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/09100633/external/openamp-zephyr-demo/k26-smk-kr-sdt-multidomain_openamp-zephyr-demo_09100633.tar.gz"
SRC_URI[sha256sum] = "f51ee638a5b2fb42b3dad1aed67720a585c3136c2b2dec69f7e8acf70f0144cc"

OPENAMPFW_BOARD = "kr260"
OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
