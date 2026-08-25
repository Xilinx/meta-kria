SUMMARY = "Packagegroup pulling in the Kria-SOM-specific runtime \
(firmware, dashboard, xmutil, platformstats, board-id-data, etc.)."
DESCRIPTION = "Kria SOM related packages"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:kria = "${MACHINE}"
COMPATIBLE_MACHINE:amd-cortexa53-mali-common = "${MACHINE}"
PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

KRIA_PACKAGES = " \
        bridge-utils \
        can-utils \
        cpufrequtils \
        e2fsprogs \
        i2c-tools \
        mtd-utils \
        pciutils \
        smartmontools \
        usbutils \
        util-linux \
        ${KRIA_ARCH_PACKAGES} \
        image-update \
        kria-dashboard \
        ldd \
        ${@bb.utils.contains('BBFILE_COLLECTIONS', 'kria-bsp', 'lmsensors-config-kria-fancontrol', '', d)} \
        ntp \
        packagegroup-core-full-cmdline \
        packagegroup-core-ssh-openssh \
        packagegroup-core-tools-debug \
        ${@bb.utils.contains('BBFILE_COLLECTIONS', 'jupyter-layer', 'packagegroup-xilinx-jupyter', '', d)} \
        packagegroup-networking-stack \
        packagegroup-security-tpm2 \
        python3-pip \
        python3-multiprocessing \
        python3-numpy \
        python3-shell \
        python3-threading \
        python3-pyserial \
        python3-h5py \
        tree \
        tzdata \
        xmutil \
"

# Board firmware lives in the meta-kria-bsp sub-layer (collection "kria-bsp").
# Guard on its presence so this core packagegroup degrades cleanly when only
# meta-kria-core is in the layer set, rather than declaring a core->bsp
# dependency.
KRIA_ARCH_PACKAGES = ""
KRIA_ARCH_PACKAGES:k26-smk = "${@bb.utils.contains('BBFILE_COLLECTIONS', 'kria-bsp', 'k26-starter-kits', '', d)}"
KRIA_ARCH_PACKAGES:k24-smk = "${@bb.utils.contains('BBFILE_COLLECTIONS', 'kria-bsp', 'k24-starter-kits', '', d)}"
KRIA_ARCH_PACKAGES:amd-cortexa53-mali-common = "${@bb.utils.contains('BBFILE_COLLECTIONS', 'kria-bsp', 'k26-starter-kits k24-starter-kits', '', d)}"

RDEPENDS:${PN} = "${KRIA_PACKAGES}"
