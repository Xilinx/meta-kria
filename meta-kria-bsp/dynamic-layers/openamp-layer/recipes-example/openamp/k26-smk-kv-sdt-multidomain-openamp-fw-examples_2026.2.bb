SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria KV260 starter kit"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria KV260 starter kit."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k26-smk-kv-sdt-multidomain_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/09280533/external/openamp-zephyr-demo/k26-smk-kv-sdt-multidomain_openamp-zephyr-demo_09280533.tar.gz"
SRC_URI[sha256sum] = "c9446f43562b320a895bd829d1ddd8014edd8a14073aa568c1b6333044d7543a"

OPENAMPFW_BOARD = "kv260"
OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
