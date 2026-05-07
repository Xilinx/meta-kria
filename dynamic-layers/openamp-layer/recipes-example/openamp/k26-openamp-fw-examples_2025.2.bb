SUMMARY = "OpenAMP RPU firmware demo payloads (echo, matrix multiply, \
rpc_demo) for the AMD Kria K26 SOM."
DESCRIPTION = "Pre-built Cortex-R5 OpenAMP firmware demo payloads \
(echo, matrix-multiply, rpc_demo) that the APU-side OpenAMP example \
applications load onto the RPU on Kria K26 SOM platforms."
LICENSE = "CLOSED"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2025.2/edf_files/2025.2/11150857/external/packagegroup-openamp-fw-examples/k26-smk-sdt_packagegroup-openamp-fw-examples_11150857.tar.gz"
SRC_URI[sha256sum] = "fbec427fffd1c6ee0afa840c0a93f879ae13c67e13b7aa9a5b6e0ae7abd41f75"

require conf/includes/openamp-fw-example.inc
