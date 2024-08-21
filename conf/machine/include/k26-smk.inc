#### Preamble
MACHINEOVERRIDES =. "${@['', 'k26-smk:']['k26-smk' != '${MACHINE}']}"
#### Regular settings follow

YAML_DT_BOARD_FLAGS ?= "{BOARD zynqmp-smk-k26-reva}"

UBOOT_DT_FILES ?= "\
    zynqmp-sck-kr-g-revA.dtso \
    zynqmp-sck-kr-g-revB.dtso \
    zynqmp-sck-kv-g-revA.dtso \
    zynqmp-sck-kv-g-revB.dtso \
    "

INITRAMFS_IMAGE ?= "kria-image-initramfs"

INITRAMFS_FSTYPES ?= "cpio.gz cpio.gz.u-boot tar.gz"
RAMDISK_IMAGE1 = "${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz.u-boot"

INITRAMFS_LOAD_MODULES ?= "usb2244.ko usb5744.ko"

require conf/machine/include/k26-kria-common.inc

IMAGE_BOOT_FILES = "Image ${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz.u-boot boot.scr"
IMAGE_BOOT_FILES += "devicetree/SMK-*.dtb;devicetree/"
IMAGE_BOOT_FILES += "devicetree/*.dtbo;devicetree/"

#### No additional settings should be after the Postamble
#### Postamble
PACKAGE_EXTRA_ARCHS:append = "${@['', ' k26_smk']['k26-smk' != "${MACHINE}"]}"
