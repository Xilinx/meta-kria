DESCRIPTION = "Kria SOM related packages"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:kria = "${MACHINE}"
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
        lmsensors-fancontrol \
        ntp \
        packagegroup-core-full-cmdline \
        packagegroup-core-ssh-openssh \
        packagegroup-core-tools-debug \
        packagegroup-xilinx-jupyter \
        packagegroup-networking-stack \
        packagegroup-security-tpm2 \
        python3-pip \
        python3-multiprocessing \
        python3-numpy \
        python3-shell \
        python3-threading \
        python3-threading \
        python3-pyserial \
        python3-h5py \
        resize-part \
        tree \
        tzdata \
        xmutil \
"

KRIA_ARCH_PACKAGES = ""
KRIA_ARCH_PACKAGES:k26-smk = "k26-starter-kits"
KRIA_ARCH_PACKAGES:k24-smk = "k24-starter-kits"
KRIA_ARCH_PACKAGES:kria-zynqmp-generic = "k26-starter-kits k24-starter-kits"

RDEPENDS:${PN} = "${KRIA_PACKAGES}"
