SUMMARY = "OpenAMP RPU firmware demo payloads (echo, matrix multiply, \
rpc_demo) for the AMD Kria K24 SOM."
DESCRIPTION = "Pre-built Cortex-R5 OpenAMP firmware demo payloads \
(echo, matrix-multiply, rpc_demo) that the APU-side OpenAMP example \
applications load onto the RPU on Kria K24 SOM platforms."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${WORKDIR}/k24-smk-kd-sdt-multidomain_packagegroup-openamp-fw-examples/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.1/edf_files/2026.1/05180527/external/packagegroup-openamp-fw-examples/k24-smk-kd-sdt-multidomain_packagegroup-openamp-fw-examples_05180527.tar.gz"
SRC_URI[sha256sum] = "521ab0be1722097aeaaccf43b88c3b95d52b86da122268f314c06c42ca24ad45"

require conf/includes/openamp-fw-example.inc
