DESCRIPTION = "Aibox ReID related Packages"

inherit packagegroup

AIBOX_REID_PACKAGES = " \
	aibox-reid \
	libdrm-tests \
	kv260-aibox-reid \
	kv260-aibox-reid-models \
	"

RDEPENDS:${PN} = "${AIBOX_REID_PACKAGES}"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:k26-kv = "${MACHINE}"
PACKAGE_ARCH = "${MACHINE_ARCH}"

