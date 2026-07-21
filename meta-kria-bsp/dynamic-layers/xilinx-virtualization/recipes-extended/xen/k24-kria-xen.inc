FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://k24-kria-xen-efi-config"

PACKAGE_ARCH:k24-kria = "${MACHINE_ARCH}"

# Override Xen config for ALL K24 ZynqMP platforms
do_install:append:k24-kria() {
    install -m 0644 ${WORKDIR}/k24-kria-xen-efi-config ${D}/boot/xen.cfg
}

do_deploy:append:k24-kria() {
    install -m 0644 ${WORKDIR}/k24-kria-xen-efi-config ${DEPLOYDIR}/xen.cfg
}

FILES:${PN}-efi += "/boot/xen.cfg"
