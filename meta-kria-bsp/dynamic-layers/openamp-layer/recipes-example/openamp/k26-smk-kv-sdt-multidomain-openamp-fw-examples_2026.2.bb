SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria KV260 starter kit"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria KV260 starter kit."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k26-smk-kv-sdt-multidomain_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/09270540/external/openamp-zephyr-demo/k26-smk-kv-sdt-multidomain_openamp-zephyr-demo_09270540.tar.gz"
SRC_URI[sha256sum] = "cb5d8d7823a5174eb4cd91eb11ea427f6c0c5bedb80487c6f41c94ab35dd4ad8"

OPENAMPFW_BOARD = "kv260"
OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
