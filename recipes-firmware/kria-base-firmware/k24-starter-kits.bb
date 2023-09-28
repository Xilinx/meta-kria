SUMMARY = "Base firmware for the k24 starter kits"

include kria-base-firmware.inc
inherit update-alternatives

FW_DIR = "k24_starter_kits"

COMPATIBLE_MACHINE:k24-smk = "${MACHINE}"
