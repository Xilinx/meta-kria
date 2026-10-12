SUMMARY = "Zephyr OpenAMP RPU firmware demo for the AMD Kria KV260 starter kit"
DESCRIPTION = "Pre-built Cortex-R5 Zephyr OpenAMP firmware demo payload for the AMD Kria KV260 starter kit."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${UNPACKDIR}/k26-smk-kv-sdt-multidomain_openamp-zephyr-demo/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/10120532/external/openamp-zephyr-demo/k26-smk-kv-sdt-multidomain_openamp-zephyr-demo_10120532.tar.gz"
SRC_URI[sha256sum] = "36d24990223ec20434333c79f37fd76426a6aa54e42d640bec173e6b4d9ed3bd"

OPENAMPFW_BOARD = "kv260"
OPENAMPFW_PKGDIR_SUFFIX = "openamp-zephyr-demo"
require conf/includes/openamp-fw-example.inc
