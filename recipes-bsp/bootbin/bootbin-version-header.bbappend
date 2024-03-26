require xilinx-bootbin-version.inc

COMPATIBLE_MACHINE:k26-kria = "${MACHINE}"
COMPATIBLE_MACHINE:k24-kria = "${MACHINE}"

python do_configure:prepend:kria() {
    version = d.getVar("MACHINE")[0:3].upper() + "-BootFW-" + d.getVar("BOOTBIN_VER_MAIN")
}
