SUMMARY = "OpenAMP firmware examples demo payload processing"
DESCRIPTION = "OpenAMP firmware examples demo payload processing"
LICENSE = "CLOSED"

SRC_URI = "https://petalinux.xilinx.com/sswreleases/rel-v2025.2/edf_files/2025.2/10150000/external/packagegroup-openamp-fw-examples/k26-smk-sdt_packagegroup-openamp-fw-examples_10150000.tar.gz"
SRC_URI[sha256sum] = "c11a084ae6d6ab7032b7ccc7665539645953ca995a570fff9c1b1448a35d225a"

require openamp-fw-example-kria.inc
