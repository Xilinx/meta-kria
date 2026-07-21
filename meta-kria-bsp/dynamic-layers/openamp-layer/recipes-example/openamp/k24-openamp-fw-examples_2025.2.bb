SUMMARY = "OpenAMP RPU firmware demo payloads (echo, matrix multiply, \
rpc_demo) for the AMD Kria K24 SOM."
DESCRIPTION = "Pre-built Cortex-R5 OpenAMP firmware demo payloads \
(echo, matrix-multiply, rpc_demo) that the APU-side OpenAMP example \
applications load onto the RPU on Kria K24 SOM platforms."
LICENSE = "CLOSED"

SRC_URI = "https://edf.amd.com/sswreleases/rel-v2025.2/edf_files/2025.2/11150857/external/packagegroup-openamp-fw-examples/k24-smk-sdt_packagegroup-openamp-fw-examples_11150857.tar.gz"
SRC_URI[sha256sum] = "9ee4ff0b4b18563e35bdb314d4275ade5a22f2df988b09c75ea0cf272efc26c2"

require conf/includes/openamp-fw-example.inc
