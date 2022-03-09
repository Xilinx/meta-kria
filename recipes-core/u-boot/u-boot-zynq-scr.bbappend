BOOTMODE:kv260-starter-kit = "generic"
BOOTFILE_EXT:kv260-starter-kit = ""

RAMDISK_IMAGE1:kv260-starter-kit = "${INITRAMFS_IMAGE}-kv260-starter-kit.cpio.gz.u-boot"
KERNEL_IMAGE:kv260-starter-kit = "Image"

QSPI_RAMDISK_OFFSET:kv260-starter-kit = "0x4000000"
QSPI_FIT_IMAGE_OFFSET:kv260-starter-kit = "0xF40000"
NAND_RAMDISK_OFFSET:kv260-starter-kit = "0x7800000"
NAND_FIT_IMAGE_OFFSET:kv260-starter-kit = "0x4180000"
