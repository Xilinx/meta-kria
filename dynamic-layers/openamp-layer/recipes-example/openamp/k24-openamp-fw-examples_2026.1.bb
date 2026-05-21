SUMMARY = "OpenAMP RPU firmware demo payloads (echo, matrix multiply, \
rpc_demo) for the AMD Kria K24 SOM."
DESCRIPTION = "Pre-built Cortex-R5 OpenAMP firmware demo payloads \
(echo, matrix-multiply, rpc_demo) that the APU-side OpenAMP example \
applications load onto the RPU on Kria K24 SOM platforms."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${WORKDIR}/k24-smk-kd-sdt-multidomain_packagegroup-openamp-fw-examples/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.1/edf_files/2026.1/05210539/external/packagegroup-openamp-fw-examples/k24-smk-kd-sdt-multidomain_packagegroup-openamp-fw-examples_05210539.tar.gz"
SRC_URI[sha256sum] = "6a209617ee9279bd66e3d1e3bbab313a4fd03c0cf607d47217f91c75f8aef392"

require conf/includes/openamp-fw-example.inc
