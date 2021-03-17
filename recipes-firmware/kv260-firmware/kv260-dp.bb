SUMMARY = "Firmware for the kv260 DP"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=dd9ae8acf8cb9f92dcbbde7f283efe8e"

inherit fpgamanager_custom
include kv260-firmware.inc

FW_DIR = "dp"

# Override the default package arch inherited from kv260-firmware.inc which
# is k26-kv. In order to add this package into the starter rootfs, the arch
# is changed to k26 instead. Do this only for this package as kv260-dp will
# be used as the default firmware to be loaded by dfx-mgrd during init.
COMPATIBLE_MACHINE_k26 = "${MACHINE}"
PACKAGE_ARCH = "${BOARD_ARCH}"
