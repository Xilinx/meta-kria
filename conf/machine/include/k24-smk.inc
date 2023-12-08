#### Preamble
MACHINEOVERRIDES =. "${@['', 'k24-smk:']['k24-smk' != '${MACHINE}']}"
#### Regular settings follow

YAML_DT_BOARD_FLAGS ?= "{BOARD zynqmp-smk-k24-reva}"

UBOOT_DT_FILES ?= "\
    zynqmp-sck-kd-g-revA.dts \
    zynqmp-sck-kv-g-revA.dts \
    zynqmp-sck-kv-g-revB.dts \
    "

INITRAMFS_IMAGE ?= "kria-image-initramfs"

INITRAMFS_FSTYPES ?= "cpio.gz cpio.gz.u-boot tar.gz"
RAMDISK_IMAGE1 = "${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz.u-boot"

IMAGE_BOOT_FILES = "Image ${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz.u-boot boot.scr"
IMAGE_BOOT_FILES += "devicetree/SMK-*.dtb;devicetree/"
IMAGE_BOOT_FILES += "devicetree/*.dtbo;devicetree/"

require conf/machine/include/k24-kria-common.inc
require conf/machine/include/kria-qemu-kd.inc

HDF_MACHINE = "k24-smk"

#### No additional settings should be after the Postamble
#### Postamble
PACKAGE_EXTRA_ARCHS:append = "${@['', ' k24_smk']['k24-smk' != "${MACHINE}"]}"
