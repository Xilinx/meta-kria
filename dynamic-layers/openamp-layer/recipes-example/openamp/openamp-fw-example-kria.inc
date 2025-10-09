# all recipes using this *inc need to define the following variables
# the following variables have the specified defaults
# (some of which can be overridden)
#    OPENAMPFW_CORE: the core on which the demo is to run
#        default: "r5"
#    OPENAMPFW_SLOT: the core slot on which the demo is to run
#        default: "0"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:kria = "${MACHINE}"

do_compile[noexec] = "1"

OPENAMPFW_BASEDIR = "${nonarch_base_libdir}/firmware/xilinx"
OPENAMPFW_BOARD = "${@d.getVar("BPN").split("-")[0]}"
OPENAMPFW_CORE ?= "r5"
OPENAMPFW_SLOT ?= "0"
OPENAMPFW_PKGDIR ?= "${OPENAMPFW_BOARD}-smk-sdt_openamp-fw-examples"

S = "${WORKDIR}/${OPENAMPFW_PKGDIR}"

do_install() {
    if [ -z "${OPENAMPFW_CORE}" ]; then
        bberror "OPENAMPFW_CORE is not set"
        exit 1
    fi
    if [ -z "${OPENAMPFW_SLOT}" ]; then
        bberror "OPENAMPFW_SLOT is not set"
        exit 1
    fi
    if [ -z "${OPENAMPFW_PKGDIR}" ]; then
        bberror "OPENAMPFW_PKGDIR is not set"
        exit 1
    fi

    for DEMO in $(ls ${S}/*elf); do
        DEMO=$(basename -s .elf ${DEMO})
        FULL_NAME=${OPENAMPFW_BOARD}-${OPENAMPFW_CORE}-${OPENAMPFW_SLOT}-${DEMO}
        bbnote "DEMO:  ${DEMO}"
        bbnote "BOARD: ${OPENAMPFW_BOARD}"
        bbnote "CORE:  ${OPENAMPFW_CORE}"
        bbnote "SLOT:  ${OPENAMPFW_SLOT}"
        bbnote "PKGDIR:${OPENAMPFW_PKGDIR}"
        bbnote "FULLNM:${FULL_NAME}"

        install -d ${D}${OPENAMPFW_BASEDIR}/${OPENAMPFW_BOARD}/rpu/${FULL_NAME}/${FULL_NAME}_slot${OPENAMPFW_SLOT}
        install -Dm 0644 ${S}/${DEMO}.elf ${D}${OPENAMPFW_BASEDIR}/${OPENAMPFW_BOARD}/rpu/${FULL_NAME}/${FULL_NAME}_slot${OPENAMPFW_SLOT}/${FULL_NAME}.elf
   done
}

PACKAGE_ARCH = "${MACHINE_ARCH}"
INSANE_SKIP:${PN} += "arch usrmerge"

FILES:${PN} += "${OPENAMPFW_BASEDIR}"
