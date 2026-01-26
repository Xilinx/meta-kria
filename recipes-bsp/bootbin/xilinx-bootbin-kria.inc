# Kria uses a FIT blob instead of separate device-tree
BIF_DEVICETREE_ATTR:kria = "u-boot-xlnx-fit-blob"

# Partition attributes and images for Kria-specific components
BIF_PARTITION_ATTR[bootbin-version-header] = "udf_bh"
# Override the image path for Kria (uses sysroot instead of deploy dir)
BIF_VERSION_HEADER_IMAGE:kria = "${RECIPE_SYSROOT}/boot/bootbin-version-header.txt"
BIF_PARTITION_IMAGE[bootbin-version-header] = "${BIF_VERSION_HEADER_IMAGE}"

BIF_PARTITION_ATTR[u-boot-xlnx-fit-blob] = "destination_cpu=a53-0,load=0x100000"
BIF_PARTITION_IMAGE[u-boot-xlnx-fit-blob] = "${RECIPE_SYSROOT}/boot/fit-dtb.blob"

require xilinx-bootbin-version.inc
