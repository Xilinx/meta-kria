require kria-qemu-common.inc

QEMU_HW_DTB_PS = "${QEMU_HW_DTB_PATH}/board-zynqmp-k26-starterkit-virt.dtb"

QB_OPT_APPEND += "\ 
    -blockdev filename=@DEPLOY_DIR_IMAGE@/kv-eeprom.bin,node-name=i2c1.eeprom-51,driver=file \
"

QB_ROOTFS_OPT = "-drive file=@ROOTFS@,if=sd,format=raw,index=1"
