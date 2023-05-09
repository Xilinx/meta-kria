FILESEXTRAPATHS:append := ":${THISDIR}/u-boot-xlnx-scr"

BOOTMODE:k26-smk = ""
BOOTMODE:k24-smk = ""
BOOTFILE_EXT:k26-smk = "k26"
BOOTFILE_EXT:k24-smk = "k24"

SRC_URI:append:k26-smk = " file://boot.cmd.${BOOTFILE_EXT}"
SRC_URI:append:k24-smk = " file://boot.cmd.${BOOTFILE_EXT}"
