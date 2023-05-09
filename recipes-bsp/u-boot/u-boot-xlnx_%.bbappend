FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:k26-kria = " \
	file://vars \
	file://som_bootmenu.cfg \
	file://som_k26.cfg \
	"

SRC_URI:append:k24-kria = " \
	file://vars_k24 \
	file://som_bootmenu.cfg \
	file://som_k24.cfg \
	"

do_configure:append:k26-kria () {
	install ${WORKDIR}/vars ${S}/.
}

do_configure:append:k24-kria () {
	install ${WORKDIR}/vars_k24 ${S}/vars
}

# u-boot blob generation configuration for k26
UBOOT_IMAGE_BLOB_DEFAULT:k26-kria = "1"
DT_BLOB_DIR:k26-kria = "${B}/arch/arm/dts/dt-blob"

IMPORT_CC_DTBS:k26-kria = " \
		zynqmp-sck-kv-g-revA.dtbo:zynqmp-smk-k26-revA.dtb:zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA.dtb \
		zynqmp-sck-kv-g-revB.dtbo:zynqmp-smk-k26-revA.dtb:zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB.dtb \
		zynqmp-sck-kr-g-revA.dtbo:zynqmp-smk-k26-revA.dtb:zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revA.dtb \
		zynqmp-sck-kr-g-revB.dtbo:zynqmp-smk-k26-revA.dtb:zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB.dtb \
		zynqmp-sck-kv-g-revA.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revA.dtb \
		zynqmp-sck-kv-g-revB.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revB.dtb \
		zynqmp-sck-kr-g-revA.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gc-revA-sck-kr-g-revA.dtb \
		zynqmp-sck-kr-g-revB.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gc-revA-sck-kr-g-revB.dtb \
		zynqmp-sck-kv-g-revA.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revA.dtb \
		zynqmp-sck-kv-g-revB.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revB.dtb \
		zynqmp-sck-kr-g-revA.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gi-revA-sck-kr-g-revA.dtb \
		zynqmp-sck-kr-g-revB.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gi-revA-sck-kr-g-revB.dtb \
		zynqmp-sck-kv-g-revA.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revA.dtb \
		zynqmp-sck-kv-g-revB.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revB.dtb \
		zynqmp-sck-kr-g-revA.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-revA.dtb \
		zynqmp-sck-kr-g-revB.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-revB.dtb \
		zynqmp-sck-kv-g-revA.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revA.dtb \
		zynqmp-sck-kv-g-revB.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revB.dtb \
		zynqmp-sck-kr-g-revA.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-revA.dtb \
		zynqmp-sck-kr-g-revB.dtbo:zynqmp-sm-k26-revA.dtb:zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-revB.dtb \
		"

CC_DTBS_DUP:k26-kria = " \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revZ \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-revA-sck-kv-g-rev1 \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-revA-sck-kv-g-rev2 \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-smk-k26-xcl2g-revB-sck-kv-g-revA \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-smk-k26-xcl2g-revB-sck-kv-g-revZ \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-revB-sck-kv-g-revB \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-revB-sck-kv-g-rev1 \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-revB-sck-kv-g-rev2 \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-smk-k26-xcl2g-rev1-sck-kv-g-revA \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-smk-k26-xcl2g-rev1-sck-kv-g-revZ \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-rev1-sck-kv-g-revB \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-rev1-sck-kv-g-rev1 \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-rev1-sck-kv-g-rev2 \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-smk-k26-xcl2g-revA-sck-kr-g-rev1 \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revA:zynqmp-smk-k26-xcl2g-revB-sck-kr-g-revA \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-smk-k26-xcl2g-revB-sck-kr-g-revB \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-smk-k26-xcl2g-revB-sck-kr-g-rev1 \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revA:zynqmp-smk-k26-xcl2g-rev1-sck-kr-g-revA \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-smk-k26-xcl2g-rev1-sck-kr-g-revB \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-smk-k26-xcl2g-rev1-sck-kr-g-rev1 \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-smk-k26-xcl2g-ed-revA-sck-kv-g-revA \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-ed-revA-sck-kv-g-revB \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revA:zynqmp-smk-k26-xcl2g-ed-revA-sck-kr-g-revA \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-smk-k26-xcl2g-ed-revA-sck-kr-g-revB \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-smk-k26-xcl2g-ed-revA-sck-kv-g-revZ \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-ed-revA-sck-kv-g-rev1 \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-ed-revA-sck-kv-g-rev2 \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-smk-k26-xcl2g-ed-revB-sck-kv-g-revA \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-smk-k26-xcl2g-ed-revB-sck-kv-g-revZ \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-ed-revB-sck-kv-g-revB \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-ed-revB-sck-kv-g-rev1 \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-ed-revB-sck-kv-g-rev2 \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-smk-k26-xcl2g-ed-rev1-sck-kv-g-revA \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revA:zynqmp-smk-k26-xcl2g-ed-rev1-sck-kv-g-revZ \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-ed-rev1-sck-kv-g-revB \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-ed-rev1-sck-kv-g-rev1 \
		zynqmp-smk-k26-xcl2g-revA-sck-kv-g-revB:zynqmp-smk-k26-xcl2g-ed-rev1-sck-kv-g-rev2 \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-smk-k26-xcl2g-ed-revA-sck-kr-g-rev1 \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revA:zynqmp-smk-k26-xcl2g-ed-revB-sck-kr-g-revA \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-smk-k26-xcl2g-ed-revB-sck-kr-g-revB \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-smk-k26-xcl2g-ed-revB-sck-kr-g-rev1 \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revA:zynqmp-smk-k26-xcl2g-ed-rev1-sck-kr-g-revA \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-smk-k26-xcl2g-ed-rev1-sck-kr-g-revB \
		zynqmp-smk-k26-xcl2g-revA-sck-kr-g-revB:zynqmp-smk-k26-xcl2g-ed-rev1-sck-kr-g-rev1 \
		zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revZ \
		zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-rev1 \
		zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-rev2 \
		zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gi-revB-sck-kv-g-revA \
		zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gi-revB-sck-kv-g-revZ \
		zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-revB-sck-kv-g-revB \
		zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-revB-sck-kv-g-rev1 \
		zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-revB-sck-kv-g-rev2 \
		zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gi-rev1-sck-kv-g-revA \
		zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gi-rev1-sck-kv-g-revZ \
		zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-rev1-sck-kv-g-revB \
		zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-rev1-sck-kv-g-rev1 \
		zynqmp-sm-k26-xcl2gi-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-rev1-sck-kv-g-rev2 \
		zynqmp-sm-k26-xcl2gi-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gi-revA-sck-kr-g-rev1 \
		zynqmp-sm-k26-xcl2gi-revA-sck-kr-g-revA:zynqmp-sm-k26-xcl2gi-revB-sck-kr-g-revA \
		zynqmp-sm-k26-xcl2gi-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gi-revB-sck-kr-g-revB \
		zynqmp-sm-k26-xcl2gi-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gi-revB-sck-kr-g-rev1 \
		zynqmp-sm-k26-xcl2gi-revA-sck-kr-g-revA:zynqmp-sm-k26-xcl2gi-rev1-sck-kr-g-revA \
		zynqmp-sm-k26-xcl2gi-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gi-rev1-sck-kr-g-revB \
		zynqmp-sm-k26-xcl2gi-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gi-rev1-sck-kr-g-rev1 \
		zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revZ \
		zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-rev1 \
		zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-rev2 \
		zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gc-revB-sck-kv-g-revA \
		zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gc-revB-sck-kv-g-revZ \
		zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-revB-sck-kv-g-revB \
		zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-revB-sck-kv-g-rev1 \
		zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-revB-sck-kv-g-rev2 \
		zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gc-rev1-sck-kv-g-revA \
		zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gc-rev1-sck-kv-g-revZ \
		zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-rev1-sck-kv-g-revB \
		zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-rev1-sck-kv-g-rev1 \
		zynqmp-sm-k26-xcl2gc-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-rev1-sck-kv-g-rev2 \
		zynqmp-sm-k26-xcl2gc-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gc-revA-sck-kr-g-rev1 \
		zynqmp-sm-k26-xcl2gc-revA-sck-kr-g-revA:zynqmp-sm-k26-xcl2gc-revB-sck-kr-g-revA \
		zynqmp-sm-k26-xcl2gc-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gc-revB-sck-kr-g-revB \
		zynqmp-sm-k26-xcl2gc-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gc-revB-sck-kr-g-rev1 \
		zynqmp-sm-k26-xcl2gc-revA-sck-kr-g-revA:zynqmp-sm-k26-xcl2gc-rev1-sck-kr-g-revA \
		zynqmp-sm-k26-xcl2gc-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gc-rev1-sck-kr-g-revB \
		zynqmp-sm-k26-xcl2gc-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gc-rev1-sck-kr-g-rev1 \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revA \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revB \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-revA:zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-revA \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-revB \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revZ \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-rev1 \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-rev2 \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gi-ed-revB-sck-kv-g-revA \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gi-ed-revB-sck-kv-g-revZ \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-ed-revB-sck-kv-g-revB \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-ed-revB-sck-kv-g-rev1 \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-ed-revB-sck-kv-g-rev2 \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gi-ed-rev1-sck-kv-g-revA \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gi-ed-rev1-sck-kv-g-revZ \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-ed-rev1-sck-kv-g-revB \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-ed-rev1-sck-kv-g-rev1 \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gi-ed-rev1-sck-kv-g-rev2 \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-rev1 \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-revA:zynqmp-sm-k26-xcl2gi-ed-revB-sck-kr-g-revA \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gi-ed-revB-sck-kr-g-revB \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gi-ed-revB-sck-kr-g-rev1 \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-revA:zynqmp-sm-k26-xcl2gi-ed-rev1-sck-kr-g-revA \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gi-ed-rev1-sck-kr-g-revB \
		zynqmp-sm-k26-xcl2gi-ed-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gi-ed-rev1-sck-kr-g-rev1 \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revA \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revB \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-revA:zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-revA \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-revB \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revZ \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-rev1 \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-rev2 \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gc-ed-revB-sck-kv-g-revA \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gc-ed-revB-sck-kv-g-revZ \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-ed-revB-sck-kv-g-revB \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-ed-revB-sck-kv-g-rev1 \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-ed-revB-sck-kv-g-rev2 \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gc-ed-rev1-sck-kv-g-revA \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revA:zynqmp-sm-k26-xcl2gc-ed-rev1-sck-kv-g-revZ \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-ed-rev1-sck-kv-g-revB \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-ed-rev1-sck-kv-g-rev1 \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kv-g-revB:zynqmp-sm-k26-xcl2gc-ed-rev1-sck-kv-g-rev2 \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-rev1 \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-revA:zynqmp-sm-k26-xcl2gc-ed-revB-sck-kr-g-revA \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gc-ed-revB-sck-kr-g-revB \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gc-ed-revB-sck-kr-g-rev1 \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-revA:zynqmp-sm-k26-xcl2gc-ed-rev1-sck-kr-g-revA \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gc-ed-rev1-sck-kr-g-revB \
		zynqmp-sm-k26-xcl2gc-ed-revA-sck-kr-g-revB:zynqmp-sm-k26-xcl2gc-ed-rev1-sck-kr-g-rev1 \
		"

# u-boot blob generation configuration for k24
UBOOT_IMAGE_BLOB_DEFAULT:k24-kria = "1"
DT_BLOB_DIR:k24-kria = "${B}/arch/arm/dts/dt-blob"

IMPORT_CC_DTBS:k24-kria = " \
    zynqmp-sck-kv-g-revA.dtbo:zynqmp-smk-k24-revA.dtb:zynqmp-smk-k24-xcl2g-revA-sck-kv-g-revA.dtb \
    zynqmp-sck-kv-g-revB.dtbo:zynqmp-smk-k24-revA.dtb:zynqmp-smk-k24-xcl2g-revA-sck-kv-g-revB.dtb \
    zynqmp-sck-kd-g-revA.dtbo:zynqmp-smk-k24-revA.dtb:zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA.dtb \
    zynqmp-sck-kv-g-revA.dtbo:zynqmp-smk-k24-revA.dtb:zynqmp-smk-k24-xcl2gi-revA-sck-kv-g-revA.dtb \
    zynqmp-sck-kv-g-revB.dtbo:zynqmp-smk-k24-revA.dtb:zynqmp-smk-k24-xcl2gi-revA-sck-kv-g-revB.dtb \
    zynqmp-sck-kd-g-revA.dtbo:zynqmp-smk-k24-revA.dtb:zynqmp-smk-k24-xcl2gi-revA-sck-kd-g-revA.dtb \
    zynqmp-sck-kv-g-revA.dtbo:zynqmp-smk-k24-revA.dtb:zynqmp-smk-k24-xcl2gc-revA-sck-kv-g-revA.dtb \
    zynqmp-sck-kv-g-revB.dtbo:zynqmp-smk-k24-revA.dtb:zynqmp-smk-k24-xcl2gc-revA-sck-kv-g-revB.dtb \
    zynqmp-sck-kd-g-revA.dtbo:zynqmp-smk-k24-revA.dtb:zynqmp-smk-k24-xcl2gc-revA-sck-kd-g-revA.dtb \
"

CC_DTBS_DUP:k24-kria = ""

