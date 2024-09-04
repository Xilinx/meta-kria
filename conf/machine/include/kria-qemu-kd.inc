require kria-qemu-common.inc

QB_ROOTFS_OPT = "-drive file=@ROOTFS@,if=none,format=raw,id=stick"

QB_NETWORK_DEVICE = "-net nic -net nic,netdev=net0,macaddr=@MAC@"

QB_OPT_APPEND += " \
    -hw-dtb ${DEPLOY_DIR_IMAGE}/qemu-hw-devicetrees/multiarch/board-zynqmp-kd240.dtb \
    -device usb-hub,bus=usb3@0xFE200000.0,port=1,id=usb-hub \
    -device usb-storage,bus=usb3@0xFE200000.0,port=1.1,id=usbstick,drive=stick \
    -blockdev filename=${DEPLOY_DIR_IMAGE}/kd-eeprom.bin,node-name=i2c1.eeprom-51,driver=file \
"
