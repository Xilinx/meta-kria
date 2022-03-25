# Override fancontrol configuration file, making this k26 specific
FILESEXTRAPATHS:prepend:k26 := "${THISDIR}/${PN}:"

PACKAGE_ARCH:k26 = "${MACHINE_ARCH}"
