DESCRIPTION = "Defect detection AA4 related packages"

inherit packagegroup

DEFECTDETECT_AA4_PACKAGES = " \
	ap1302-ar0144-single-firmware \
	defectdetection-aa4 \
	kv260-defect-detection-aa4 \
	kv260-module-sw-fmt-converter \
	libdrm-tests \
	"

RDEPENDS_${PN} = "${DEFECTDETECT_AA4_PACKAGES}"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE_k26-kv = "${MACHINE}"
PACKAGE_ARCH = "${BOARDVARIANT_ARCH}"

