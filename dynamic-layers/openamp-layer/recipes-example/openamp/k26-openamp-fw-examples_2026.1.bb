SUMMARY = "OpenAMP RPU firmware demo payloads (echo, matrix multiply, \
rpc_demo) for the AMD Kria K26 SOM."
DESCRIPTION = "Pre-built Cortex-R5 OpenAMP firmware demo payloads \
(echo, matrix-multiply, rpc_demo) that the APU-side OpenAMP example \
applications load onto the RPU on Kria K26 SOM platforms."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${WORKDIR}/k26-smk-kv-sdt-multidomain_packagegroup-openamp-fw-examples/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.1/edf_files/2026.1/06020328/external/packagegroup-openamp-fw-examples/k26-smk-kv-sdt-multidomain_packagegroup-openamp-fw-examples_06020328.tar.gz"
SRC_URI[sha256sum] = "d8988870e2f094be74acf6b8373e66a52a0c4bd80ab56cd754f49c50e97bd383"

require conf/includes/openamp-fw-example.inc
