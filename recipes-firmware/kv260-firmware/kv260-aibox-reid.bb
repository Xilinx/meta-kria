SUMMARY = "Firmware for the kv260 aibox AA2 design"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=dd9ae8acf8cb9f92dcbbde7f283efe8e"

inherit fpgamanager_custom
include kv260-firmware.inc

FW_DIR = "aibox-reid"
