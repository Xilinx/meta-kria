# Prevent boot delay on devices with multiple network interfaces
do_install:append:kria() {
    if [ -f ${D}${systemd_system_unitdir}/systemd-networkd-wait-online.service ]; then
        sed -i '/ExecStart/ s/$/ --any/' ${D}${systemd_system_unitdir}/systemd-networkd-wait-online.service
    fi
}
