SUMMARY = "OpenAMP RPU firmware demo payloads (echo, matrix multiply, \
rpc_demo) for the AMD Kria K24 SOM."
DESCRIPTION = "Pre-built Cortex-R5 OpenAMP firmware demo payloads \
(echo, matrix-multiply, rpc_demo) that the APU-side OpenAMP example \
applications load onto the RPU on Kria K24 SOM platforms."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${S}/k24-smk-kd-sdt-multidomain_packagegroup-openamp-fw-examples/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.2/edf_files/2026.2/07280851/external/packagegroup-openamp-fw-examples/k24-smk-kd-sdt-multidomain_packagegroup-openamp-fw-examples_07280851.tar.gz"
SRC_URI[sha256sum] = "fe78c868c449d1ff9e44455db10f9488fbeb1e8c07586a3ca38a3de4a9d10209"

require conf/includes/openamp-fw-example.inc
