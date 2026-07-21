FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append:k24-sm = " file://kria-prod-bootmenu.cfg"
SRC_URI:append:k26-sm = " file://kria-prod-bootmenu.cfg"

# For common u-boot configuration for kria devices.
SRC_URI:append:kria = " file://kria-common.cfg"
