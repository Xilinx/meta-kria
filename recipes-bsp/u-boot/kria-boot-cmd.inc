#SFILESEXTRAPATHS:append := ":${THISDIR}/${PN}"
FILESEXTRAPATHS:append := ":${THISDIR}/u-boot-xlnx-scr"

BOOTMODE:k26-smk = ""
BOOTFILE_EXT:k26-smk = "k26"

SRC_URI:append:k26-smk = " file://boot.cmd.${BOOTFILE_EXT}"
