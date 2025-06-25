require kria-qemu-common.inc

QB_ROOTFS_OPT = "-drive file=@ROOTFS@,if=none,format=raw,id=stick"

QB_NETWORK_DEVICE = "-net nic -net nic,netdev=net0,macaddr=@MAC@"

QEMU_HW_DTB_PS = "${QEMU_HW_DTB_PATH}/board-zynqmp-kd240.dtb"

QB_OPT_APPEND += " \
    -device usb-hub,bus=usb3@0xFE200000.0,port=1,id=usb-hub \
    -device usb-storage,bus=usb3@0xFE200000.0,port=1.1,id=usbstick,drive=stick \
    -blockdev filename=@DEPLOY_DIR_IMAGE@/kd-eeprom.bin,node-name=i2c1.eeprom-51,driver=file \
    -blockdev filename=@DEPLOY_DIR_IMAGE@/som-k24-eeprom.bin,node-name=i2c1.eeprom-50,driver=file \
"
QB_PMU_OPT = "     -M microblaze-fdt     -display none     -hw-dtb @DEPLOY_DIR_IMAGE@/${QEMU_HW_DTB_PATH}/zynqmp-pmu.dtb   -kernel @DEPLOY_DIR_IMAGE@/pmu-rom.elf     -device loader,file=@DEPLOY_DIR_IMAGE@/pmu-firmware-k24-smk-kd-sdt.elf     -device loader,addr=0xfd1a0074,data=0x1011003,data-len=4     -device loader,addr=0xfd1a007C,data=0x1010f03,data-len=4     "
