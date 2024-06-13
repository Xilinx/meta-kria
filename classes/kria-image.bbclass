FEATURE_PACKAGES-kria ?= "packagegroup-kria"
FEATURE_PACKAGES_kria[optional] ?= "1"

kria_enable_lmsensor_fancontrol () {
    # Check if lmsensors-fancontrol is installed, if so enable it
    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'True', 'False', d)}" = "True" -a -e ${IMAGE_ROOTFS}/lib/systemd/system/fancontrol.service ]; then
        systemctl --root=${IMAGE_ROOTFS} enable fancontrol.service
    fi
}

ROOTFS_POSTPROCESS_COMMAND:append:kria = " kria_enable_lmsensor_fancontrol ;"
