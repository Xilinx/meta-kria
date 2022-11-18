# Override fancontrol configuration file, making this k26 specific
FILESEXTRAPATHS:prepend:kria := "${THISDIR}/${PN}:"

PACKAGE_ARCH:kria = "${MACHINE_ARCH}"
