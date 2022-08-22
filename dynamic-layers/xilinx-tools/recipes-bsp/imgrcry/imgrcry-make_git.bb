DESCRIPTION = "Image Recovery"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${WORKDIR}/git/license.txt;md5=7b5fc0b2a22e2882e1506436b3293e5d"

PROVIDES = "virtual/imgrcry"
RCONFLICTS:${PN} = "imgrcry"
DEPENDS += "bootgen-native fsbl-firmware"

ESW_VER ?= "${XILINX_VER_MAIN}"

inherit deploy xlnx-embeddedsw xsctbase

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:k26-som = "k26-som"

S = "${WORKDIR}/git/lib/sw_apps/img_rcvry/src"

PARALLEL_MAKE = "-j 1"

XSCTH_EXECUTABLE = "ImgRecovery.elf"

do_configure () {
cat > ${WORKDIR}/${PN}.bif << EOF
    the_ROM_image:
    {
        [bootloader, destination_cpu=a53-0] ${DEPLOY_DIR_IMAGE}/fsbl-${MACHINE}.elf
        [load=0x10000000] ${S}/../misc/web.img
        [destination_cpu=a53-0] ${S}/${XSCTH_EXECUTABLE}
    }
EOF
}

do_compile () {
    oe_runmake all
    bootgen -image ${WORKDIR}/${PN}.bif -arch ${SOC_FAMILY} -w -o ${B}/${PN}.bin
}

do_deploy () {
    install -Dm 0644 ${S}/../misc/web.img ${DEPLOYDIR}/imgrcry_web.img
    install -Dm 0644 ${B}/${PN}.bin ${DEPLOYDIR}/${PN}-${MACHINE}-${IMAGE_VERSION_SUFFIX}.bin
    ln -sf ${PN}-${MACHINE}-${IMAGE_VERSION_SUFFIX}.bin ${DEPLOYDIR}/imgrcry-${MACHINE}.bin
}

addtask do_deploy after do_compile
