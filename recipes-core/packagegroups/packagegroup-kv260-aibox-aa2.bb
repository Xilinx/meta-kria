DESCRIPTION = "Aibox AA2 related Packages"

inherit packagegroup

AIBOX_AA2_PACKAGES = " \
	aibox-aa2 \
	libdrm-tests \
	kv260-aibox-aa2 \
	kv260-aibox-aa2-models \
	kv260-smartcamera-aa1-models \
	"

RDEPENDS_${PN} = "${AIBOX_AA2_PACKAGES}"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE_k26-kv = "${MACHINE}"
PACKAGE_ARCH = "${BOARDVARIANT_ARCH}"

