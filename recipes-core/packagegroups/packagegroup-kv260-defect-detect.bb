DESCRIPTION = "Defect detection related packages"

inherit packagegroup

DEFECT_DETECT_PACKAGES = " \
	ap1302-ar0144-single-firmware \
	defect-detect \
	kv260-defect-detect \
	kv260-module-sw-fmt-converter \
	libdrm-tests \
	"

RDEPENDS:${PN} = "${DEFECT_DETECT_PACKAGES}"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:k26-kv = "${MACHINE}"
PACKAGE_ARCH = "${MACHINE_ARCH}"

