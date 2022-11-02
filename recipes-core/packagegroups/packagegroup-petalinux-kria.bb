DESCRIPTION = "Kira SOM related packages"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:k26 = "${MACHINE}"
COMPATIBLE_MACHINE:k24 = "${MACHINE}"
PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

KRIA_PACKAGES = " \
        packagegroup-core-full-cmdline \
        packagegroup-core-tools-debug \
        packagegroup-core-ssh-openssh \
        packagegroup-petalinux-networking-stack \
        packagegroup-petalinux-python-modules \
        packagegroup-petalinux-tpm \
        packagegroup-petalinux-utils \
        packagegroup-petalinux \
        archconfig \
        fru-print \
        image-update \
        ldd \
        ntp \
        resize-part \
        tree \
        tzdata \
        xmutil \
        kria-dashboard \
        k26-starter-kits \
        lmsensors-fancontrol \
"

#        packagegroup-petalinux-jupyter

RDEPENDS:${PN} = "${KRIA_PACKAGES}"