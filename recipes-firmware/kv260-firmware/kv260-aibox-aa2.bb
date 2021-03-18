SUMMARY = "Firmware for the kv260 aibox AA2 design"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=dd9ae8acf8cb9f92dcbbde7f283efe8e"

inherit fpgamanager_custom
include kv260-firmware.inc

FW_DIR = "aibox-aa2"

#putting different priority to not see "multiple providers with the same priority" warning
#but highest priority of default_firmware providers is kv260-dp which is set at 100
ALTERNATIVE_PRIORITY[default_firmware] = "20"
