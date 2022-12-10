SUMMARY = "Base firmware for the k26 starter kits"

include kria-base-firmware.inc
inherit update-alternatives

FW_DIR = "k26_starter_kits"

COMPATIBLE_MACHINE:k26-smk = "${MACHINE}"
