FILESEXTRAPATHS:append := ":${THISDIR}/u-boot-xlnx-scr"

BOOTMODE:k26-smk = ""
BOOTMODE:k24-smk = ""
BOOTMODE:kria-zynqmp-generic = ""

BOOTFILE_EXT:k26-smk = "kria"
BOOTFILE_EXT:k24-smk = "kria"
BOOTFILE_EXT:kria-zynqmp-generic = "kria"

SRC_URI:append:k26-smk = " file://boot.cmd.kria"
SRC_URI:append:k24-smk = " file://boot.cmd.kria"
SRC_URI:append:kria-zynqmp-generic = " file://boot.cmd.kria"
