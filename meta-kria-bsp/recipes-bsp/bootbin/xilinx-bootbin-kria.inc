# Partition attributes and images for Kria-specific components
BIF_PARTITION_ATTR[bootbin-version-header] = "udf_bh"
# Override the image path for Kria (uses sysroot instead of deploy dir)
BIF_VERSION_HEADER_IMAGE:kria = "${RECIPE_SYSROOT}/boot/bootbin-version-header.txt"
BIF_PARTITION_IMAGE[bootbin-version-header] = "${BIF_VERSION_HEADER_IMAGE}"

require xilinx-bootbin-version.inc
