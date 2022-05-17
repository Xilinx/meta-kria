DESCRIPTION = "SOM bootbin version string file"
SUMMARY = "The BIF file for the SOM bootbin requires a version file in a specific format"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:k26 = "${MACHINE}"

BOOTBIN_VERSION_FILE = "bootbin-version-header.txt"

python do_configure() {
    from datetime import date

    rev_file = d.getVar('B') + '/' + d.getVar("BOOTBIN_VERSION_FILE")
    build_date = date.today().strftime("%Y%m%d")
    version = f"XilinxSOM_BootFW_{build_date}".encode("utf-8")

    with open(rev_file, "w") as rf:
        rf.write(version.hex())
}

do_install(){
    install -d ${D}/boot
    install -m 0644 ${B}/${BOOTBIN_VERSION_FILE} ${D}/boot/
}

SYSROOT_DIRS += "/boot"
FILES:${PN} += "/boot/${BOOTBIN_VERSION_FILE}"
