DESCRIPTION = "A full featured console-only image for Kria SOM."

inherit core-image

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:k26 = "${MACHINE}"
COMPATIBLE_MACHINE:k24 = "${MACHINE}"

IMAGE_FEATURES += "splash ssh-server-dropbear hwcodecs"

IMAGE_INSTALL = " \
    packagegroup-core-boot \
    packagegroup-petalinux-som \
    kernel-modules \
    ${@'libdfx' if 'xilinx-tools' in d.getVar('BBFILE_COLLECTIONS').split() else ''} \
    hellopm \
    haveged \
    htop \
    meson \
    nfs-utils \
    nfs-utils-client \
    u-boot-tools \
    linux-xlnx-udev-rules \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    e2fsprogs-mke2fs \
    fpga-manager-script \
    fpga-manager-util \
    udev-extraconf \
    watchdog-init \
    wireless-regdb-static \
"

#These ROOTFS_POSTPROCESS_COMMANDs need to be moved into a class

k26_enable_lmsensor_fancontrol () {
    # Check if lmsensors-fancontrol is installed, if so enable it
    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'True', 'False', d)}" = "True" -a -e ${IMAGE_ROOTFS}/lib/systemd/system/fancontrol.service ]; then
        systemctl --root=${IMAGE_ROOTFS} enable fancontrol.service
    fi
}
ROOTFS_POSTPROCESS_COMMAND:append = " k26_enable_lmsensor_fancontrol ;"

k26_mount_boot () {
    echo "LABEL=boot        /boot   vfat    defaults    0   2" >> ${IMAGE_ROOTFS}/etc/fstab
}
ROOTFS_POSTPROCESS_COMMAND:append = " k26_mount_boot ;"
