FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

KRIA_SRCURI ?= ""
KRIA_SRCURI:kria ?= " \
	file://vars \
	file://kria_bootmenu.cfg \
	file://kria.cfg \
	"

SRC_URI[vardepsexclude] = "KRIA_SRCURI"
SRC_URI .= "${KRIA_SRCURI}"

do_configure:append:kria () {
	install ${WORKDIR}/vars ${S}/.
}

UBOOT_MANIFEST = "${UBOOT_BINARYNAME}-${MACHINE}-${PV}-${PR}.manifest"

do_compile:append:kria() {
    printf "* ${PN}\nSRCREV: ${SRCREV}\nBRANCH: ${UBRANCH}\n\n" > ${S}/${UBOOT_MANIFEST}
}

do_deploy:append:kria() {
    install -m 0644 ${S}/${UBOOT_MANIFEST} ${DEPLOYDIR}/
    ln -sf ${UBOOT_MANIFEST} ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${MACHINE}.manifest
}

# u-boot blob generation configuration
UBOOT_IMAGE_BLOB_DEFAULT:kria = "1"
DT_BLOB_DIR:kria = "${B}/arch/arm/dts/dt-blob"

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

CC_DTBS_DUP:k24-kria = " \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revB \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2g-revA-sck-kd-g-rev1 \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2g-revB-sck-kd-g-revA \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2g-revB-sck-kd-g-rev1 \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2g-revB-sck-kd-g-revB \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2g-rev1-sck-kd-g-revA \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2g-rev1-sck-kd-g-rev1 \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2g-rev1-sck-kd-g-revB \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gi-revA-sck-kd-g-revB \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gi-revA-sck-kd-g-rev1 \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gi-revB-sck-kd-g-revA \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gi-revB-sck-kd-g-rev1 \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gi-revB-sck-kd-g-revB \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gi-rev1-sck-kd-g-revA \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gi-rev1-sck-kd-g-rev1 \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gi-rev1-sck-kd-g-revB \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gc-revA-sck-kd-g-revB \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gc-revA-sck-kd-g-rev1 \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gc-revB-sck-kd-g-revA \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gc-revB-sck-kd-g-rev1 \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gc-revB-sck-kd-g-revB \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gc-rev1-sck-kd-g-revA \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gc-rev1-sck-kd-g-rev1 \
		zynqmp-smk-k24-xcl2g-revA-sck-kd-g-revA:zynqmp-smk-k24-xcl2gc-rev1-sck-kd-g-revB \
"

