FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
KRIA_UBOOT_PROD_CFG = ""
KRIA_UBOOT_PROD_CFG:k24-sm = "file://kria-prod-bootmenu.cfg"
KRIA_UBOOT_PROD_CFG:k26-sm = "file://kria-prod-bootmenu.cfg"

# For common u-boot configuration for kria devices.
KRIA_UBOOT_COMMON_CFG = ""
KRIA_UBOOT_COMMON_CFG:kria = "file://kria-common.cfg"

SRC_URI += "${KRIA_UBOOT_PROD_CFG} ${KRIA_UBOOT_COMMON_CFG}"
