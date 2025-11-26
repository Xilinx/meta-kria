require xilinx-bootbin-version.inc

COMPATIBLE_MACHINE:k26-kria = "${MACHINE}"
COMPATIBLE_MACHINE:k24-kria = "${MACHINE}"

python do_configure:append:kria() {
    if d.getVar('SOC_FAMILY') == 'zynqmp':
        edf_version = "{}-v{}".format(d.getVar('MACHINE'), d.getVar('BOOTBIN_VER_MAIN'))
        edf_version += d.getVar("IMAGE_VERSION_SUFFIX")

        with open(d.expand("${B}/${BOOTBIN_VER_FILE}"), "w") as f:
            f.write(edf_version.encode("utf-8").hex())

        with open(d.expand("${B}/${BOOTBIN_MANIFEST_FILE}"), "w") as f:
            f.write("* %s\n" % d.getVar('PN'))
            f.write("VERSION: %s\n" % edf_version)
            f.write("PV: %s\n" % d.getVar('PV'))
            f.write("XILINX_VER_MAIN: %s\n" % d.getVar('XILINX_VER_MAIN'))
            f.write("XILINX_VER_UPDATE: %s\n" % d.getVar('XILINX_VER_UPDATE'))
            f.write("XILINX_VER_BUILD: %s\n\n" % d.getVar('XILINX_VER_BUILD'))

        with open(d.expand("${B}/${BOOTBIN_ROLLBACK_COUNTER_FILE}"), "w") as f:
            f.write(edf_version)
}
