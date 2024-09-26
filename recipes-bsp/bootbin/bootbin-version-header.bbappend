require xilinx-bootbin-version.inc

COMPATIBLE_MACHINE:k26-kria = "${MACHINE}"
COMPATIBLE_MACHINE:k24-kria = "${MACHINE}"

#python do_configure:prepend:kria() {
#    version = d.getVar("MACHINE")[0:3].upper() + "-BootFW-" + d.getVar("BOOTBIN_VER_MAIN")
#}

python do_configure:prepend:kria() {
    if d.getVar('XILINX_WITH_ESW') == 'sdt' and d.getVar("WITHIN_PLNX_FLOW") == '1':
        version = '-'.join(d.getVar("MACHINE").split('-')[0:1] + d.getVar("MACHINE").split('-')[2:-1]) + "-v" + d.getVar("BOOTBIN_VER_MAIN")
}
