FILESEXTRAPATHS:append:k26-starter-kit := ":${THISDIR}/${PN}"

BOOTMODE:k26-starter-kit = ""
BOOTFILE_EXT:k26-starter-kit = "k26"

SRC_URI:append:k26-starter-kit = " file://boot.cmd.${BOOTFILE_EXT}"
