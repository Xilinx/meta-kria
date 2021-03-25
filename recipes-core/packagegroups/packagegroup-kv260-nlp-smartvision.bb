DESCRIPTION = "nlp-smartvision related Packages"

inherit packagegroup

NLP_SMARTVISION_PACKAGES = " \
	ap1302-ar1335-single-firmware \
	kv260-nlp-smartvision \
	kv260-nlp-smartvision-models \
	nlp-smartvision \
	"

RDEPENDS_${PN} = "${NLP_SMARTVISION_PACKAGES}"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE_k26-kv = "${MACHINE}"
PACKAGE_ARCH = "${BOARDVARIANT_ARCH}"

