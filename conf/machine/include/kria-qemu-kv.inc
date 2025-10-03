require kria-qemu-common.inc

QEMU_HW_DTB_PS = "${QEMU_HW_DTB_PATH}/board-zynqmp-kv260.dtb"

QB_OPT_APPEND += "\ 
    -blockdev filename=@DEPLOY_DIR_IMAGE@/kv-eeprom.bin,node-name=i2c1.eeprom-51,driver=file \
    -blockdev filename=@DEPLOY_DIR_IMAGE@/som-k26-eeprom.bin,node-name=i2c1.eeprom-50,driver=file \
"

QB_ROOTFS_OPT = "-drive file=@ROOTFS@,if=sd,format=raw,index=1"

QB_PMU_OPT = "     -M microblaze-fdt     -display none     -hw-dtb @DEPLOY_DIR_IMAGE@/${QEMU_HW_DTB_PATH}/zynqmp-pmu.dtb   -kernel @DEPLOY_DIR_IMAGE@/pmu-rom.elf     -device loader,file=@DEPLOY_DIR_IMAGE@/pmu-firmware-k26-smk-kv-sdt.elf     -device loader,addr=0xfd1a0074,data=0x1011003,data-len=4     -device loader,addr=0xfd1a007C,data=0x1010f03,data-len=4     "
