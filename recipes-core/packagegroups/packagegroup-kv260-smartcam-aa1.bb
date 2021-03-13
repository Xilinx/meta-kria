DESCRIPTION = "Smartcamera AA1 related Packages"

inherit packagegroup

SMARTCAM_AA1_PACKAGES = " \
	ap1302-ar1335-single-firmware \
	kv260-smartcamera-aa1 \
	kv260-smartcamera-aa1-models \
	smartcam-aa1 \
	"

RDEPENDS_${PN} = "${SMARTCAM_AA1_PACKAGES}"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE_k26-kv = "${MACHINE}"
PACKAGE_ARCH = "${BOARDVARIANT_ARCH}"

