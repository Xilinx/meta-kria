require kria-qemu-common.inc

QB_OPT_APPEND += "\ 
    -hw-dtb ${DEPLOY_DIR_IMAGE}/qemu-hw-devicetrees/multiarch/board-zynqmp-k26-starterkit-virt.dtb \
    -blockdev filename=${DEPLOY_DIR_IMAGE}/kv-eeprom.bin,node-name=i2c1.eeprom-51,driver=file \
"

QB_ROOTFS_OPT = "-drive file=@ROOTFS@,if=sd,format=raw,index=1"
