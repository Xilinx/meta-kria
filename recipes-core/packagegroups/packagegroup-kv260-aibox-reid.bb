DESCRIPTION = "Aibox ReID related Packages"

inherit packagegroup

AIBOX_REID_PACKAGES = " \
	aibox-reid \
	libdrm-tests \
	kv260-aibox-reid \
	kv260-aibox-reid-models \
	"

RDEPENDS_${PN} = "${AIBOX_REID_PACKAGES}"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE_k26-kv = "${MACHINE}"
PACKAGE_ARCH = "${BOARDVARIANT_ARCH}"

