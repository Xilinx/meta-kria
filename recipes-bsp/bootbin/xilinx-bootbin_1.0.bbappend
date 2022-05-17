BIF_UDFBH_ATTR = "bootbin-version-header"

BIF_PARTITION_ATTR[bootbin-version-header] = "udf_bh"
BIF_PARTITION_IMAGE[bootbin-version-header] = "${RECIPE_SYSROOT}/boot/bootbin-version-header.txt"

BIF_PARTITION_ATTR[u-boot-xlnx-fit-blob] = "destination_cpu=a53-0,load=0x100000"
BIF_PARTITION_IMAGE[u-boot-xlnx-fit-blob] = "${RECIPE_SYSROOT}/boot/fit-dtb.blob"

BIF_PARTITION_ATTR:k26-som  = "${BIF_FSBL_ATTR} ${BIF_BITSTREAM_ATTR} ${BIF_ATF_ATTR} u-boot-xlnx-fit-blob ${BIF_SSBL_ATTR} bootbin-version-header"
