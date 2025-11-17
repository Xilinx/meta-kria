FILESEXTRAPATHS:append := ":${THISDIR}/u-boot-xlnx-scr"

BOOTMODE:k26-smk = ""
BOOTMODE:k24-smk = ""
BOOTMODE:kria-zynqmp-generic = ""

BOOTFILE_EXT:k26-smk = "kria"
BOOTFILE_EXT:k24-smk = "kria"
BOOTFILE_EXT:k26-sm = "kria.prod"
BOOTFILE_EXT:k24-sm = "kria.prod"
BOOTFILE_EXT:kria-zynqmp-generic = "kria"

SRC_URI:append:k26-smk = " file://boot.cmd.kria"
SRC_URI:append:k24-smk = " file://boot.cmd.kria"
SRC_URI:append:k26-sm = " file://boot.cmd.kria.prod"
SRC_URI:append:k24-sm = " file://boot.cmd.kria.prod"
SRC_URI:append:kria-zynqmp-generic = " file://boot.cmd.kria"

KERNEL_ROOT_RAMDISK:k26-smk-kv-sdt = ""
KERNEL_ROOT_RAMDISK:k26-smk-kr-sdt = ""
KERNEL_ROOT_RAMDISK:k24-smk-kd-sdt = ""
