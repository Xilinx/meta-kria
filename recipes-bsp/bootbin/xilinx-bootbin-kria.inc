# Partition attributes and images for Kria-specific components
BIF_PARTITION_ATTR[bootbin-version-header] = "udf_bh"
# Override the image path for Kria (uses sysroot instead of deploy dir)
BIF_VERSION_HEADER_IMAGE:kria = "${RECIPE_SYSROOT}/boot/bootbin-version-header.txt"
BIF_PARTITION_IMAGE[bootbin-version-header] = "${BIF_VERSION_HEADER_IMAGE}"

KRIA_DTB:k26-smk-kv-sdt = "SMK-zynqmp-sck-kv-g-revB.dtb"
KRIA_DTB:k26-smk-kr-sdt = "SMK-zynqmp-sck-kr-g-revB.dtb"
KRIA_DTB:k24-smk-kd-sdt = "SMK-zynqmp-sck-kd-g-revA.dtb"

BIF_PARTITION_ATTR[device-tree] = "destination_cpu=a53-0,load=0x100000"
BIF_PARTITION_IMAGE[device-tree] = "${RECIPE_SYSROOT}/boot/devicetree/${KRIA_DTB}"

require xilinx-bootbin-version.inc
