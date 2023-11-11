# This file should not use ?=, and should be included AFTER the base soc-variant
MACHINEOVERRIDES =. "kria:"

#FPGA manager Variables
MACHINE_FEATURES += "fpga-overlay"

SPL_BINARY = ""

IMAGE_CLASSES += "kria-image"

ATF_CONSOLE ?= "cadence1"

YAML_SERIAL_CONSOLE_BAUDRATE = "115200"

SERIAL_CONSOLES = "115200;ttyPS1"

PREFERRED_PROVIDER_virtual/imgrcry = "imgrcry-make"

EXTRA_IMAGEDEPENDS += "board-id-data"
EXTRA_IMAGEDEPENDS:remove = "virtual/boot-bin u-boot-xlnx-uenv"

IMAGE_FSTYPES += " ext4 wic wic.xz wic.qemu-sd"

WIC_DEPENDS = "virtual/kernel virtual/dtb u-boot-xlnx-scr"

KERNEL_COMMAND_APPEND ?= "root=LABEL=root"

# QEMU options
QB_DEFAULT_FSTYPE = "wic.qemu-sd"

QB_OPT_APPEND = "\
    -nodefaults \
    ${@qemu_zynqmp_unhalt(d, True)} \
    -device loader,file=${DEPLOY_DIR_IMAGE}/arm-trusted-firmware.elf,cpu-num=0 \
    -device loader,file=${DEPLOY_DIR_IMAGE}/u-boot.elf \
    -device loader,file=${DEPLOY_DIR_IMAGE}/fit-dtb.blob,addr=0x100000,force-raw=on \
    ${@qemu_add_extra_args(d)} \
    -blockdev filename=${DEPLOY_DIR_IMAGE}/som-eeprom.bin,node-name=i2c1.eeprom-50,driver=file \
    -blockdev node-name=pmu-cfg,filename=${DEPLOY_DIR_IMAGE}/pmu-conf.bin,driver=file \
    -global xlnx,zynqmp-boot.drive=pmu-cfg \
    -pmu-args '${QB_PMU_OPT}' \
"

# runqemu assumes the first serial device is used but Kria SOM uses the second, the following line is
# required in order to mark the first serial as inactive as the runqemu serial config is appended
QB_OPT_APPEND += " -serial null"
