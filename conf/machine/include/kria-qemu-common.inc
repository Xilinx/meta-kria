# QEMU specific dependencies

EXTRA_IMAGEDEPENDS += " \
    virtual/arm-trusted-firmware \
    virtual/fsbl \
    virtual/pmu-firmware \
"

# QEMU options
QB_DEFAULT_FSTYPE = "wic.qemu-sd"

# qspi 32-bit
QEMU_HW_BOOT_MODE = "2"

# The fit will load, but we also need some additional components
QEMU_DTB_LOAD = "-device loader,file=@DEPLOY_DIR_IMAGE@/fit-dtb.blob,addr=0x100000,force-raw=on"

# Additional items required for booting
QB_OPT_APPEND += " \
    -blockdev node-name=pmu-cfg,filename=@DEPLOY_DIR_IMAGE@/pmu-conf.bin,driver=file \
    -global xlnx,zynqmp-boot.drive=pmu-cfg \
    "

# runqemu assumes the first serial device is used but Kria SOM uses the second, the following line is
# required in order to mark the first serial as inactive as the runqemu serial config is appended
QEMU_HW_SERIAL = " -serial null -serial mon:stdio"
