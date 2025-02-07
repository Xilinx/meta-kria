require kria-qemu-common.inc

QB_NETWORK_DEVICE = "-net nic -net nic,netdev=net0,macaddr=@MAC@"

QEMU_HW_DTB_PS = "${QEMU_HW_DTB_PATH}/board-zynqmp-k26-starterkit-virt.dtb" 

QB_OPT_APPEND += "\
    -device usb-hub,bus=usb3@0xFE200000.0,port=1,id=usb-hub \
    -device usb-storage,bus=usb3@0xFE200000.0,port=1.1,id=usbstick,drive=stick \
    -blockdev filename=@DEPLOY_DIR_IMAGE@/kr-eeprom.bin,node-name=i2c1.eeprom-51,driver=file \
"

QB_ROOTFS_OPT = "-drive file=@ROOTFS@,if=none,format=raw,id=stick"
