DESCRIPTION = "Smartcam related Packages"

inherit packagegroup

SMARTCAM_PACKAGES = " \
	ap1302-ar1335-single-firmware \
	kv260-smartcam \
	kv260-smartcam-models \
	smartcam \
	"

RDEPENDS_${PN} = "${SMARTCAM_PACKAGES}"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE_k26-kv = "${MACHINE}"
PACKAGE_ARCH = "${BOARDVARIANT_ARCH}"

