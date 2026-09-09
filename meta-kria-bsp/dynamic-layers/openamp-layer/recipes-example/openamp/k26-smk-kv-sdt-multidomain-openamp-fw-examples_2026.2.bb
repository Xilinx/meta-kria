SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria KV260 starter kit"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria KV260 starter kit."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k26-smk-kv-sdt-multidomain_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/09090623/external/openamp-zephyr-demo/k26-smk-kv-sdt-multidomain_openamp-zephyr-demo_09090623.tar.gz"
SRC_URI[sha256sum] = "d83e54341a437e3179ac66b0eb5cb9091b8515d693b7b4711f0f57b687d1d60e"

OPENAMPFW_BOARD = "kv260"
OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
