SUMMARY = "OpenAMP RPU firmware demo payloads (echo, matrix multiply, \
rpc_demo) for the AMD Kria K26 SOM."
DESCRIPTION = "Pre-built Cortex-R5 OpenAMP firmware demo payloads \
(echo, matrix-multiply, rpc_demo) that the APU-side OpenAMP example \
applications load onto the RPU on Kria K26 SOM platforms."

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${WORKDIR}/k26-smk-kv-sdt-multidomain_packagegroup-openamp-fw-examples/LICENSE.md;md5=0b96a4c07d631aa5141bd3f058ba43b0"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2026.1/edf_files/2026.1/05220436/external/packagegroup-openamp-fw-examples/k26-smk-kv-sdt-multidomain_packagegroup-openamp-fw-examples_05220436.tar.gz"
SRC_URI[sha256sum] = "1e61d7f2c1f43cb981ae4ad3f782d55d52abccbf4a676e9d66f76560714294e9"

require conf/includes/openamp-fw-example.inc
