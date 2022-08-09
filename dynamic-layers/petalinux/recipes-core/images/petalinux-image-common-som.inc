FEATURE_PACKAGES_petalinux-som ?= "packagegroup-petalinux-som"
FEATURE_PACKAGES_petalinux-som[optional] ?= "1"

k26_enable_lmsensor_fancontrol () {
    # Check if lmsensors-fancontrol is installed, if so enable it
    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'True', 'False', d)}" = "True" -a -e ${IMAGE_ROOTFS}/lib/systemd/system/fancontrol.service ]; then
        systemctl --root=${IMAGE_ROOTFS} enable fancontrol.service
    fi
}

ROOTFS_POSTPROCESS_COMMAND:append:k26 = " k26_enable_lmsensor_fancontrol ;"

k26_mount_boot () {
    echo "LABEL=boot        /boot   vfat    defaults    0   2" >> ${IMAGE_ROOTFS}/etc/fstab
}

ROOTFS_POSTPROCESS_COMMAND:append:k26 = " k26_mount_boot ;"
