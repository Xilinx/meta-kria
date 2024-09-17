# This file should not use ?=, and should be included AFTER the base soc-variant
MACHINEOVERRIDES =. "kria:"

SPL_BINARY = ""

IMAGE_CLASSES += "kria-image"

ATF_CONSOLE ?= "cadence1"

YAML_SERIAL_CONSOLE_BAUDRATE = "115200"

SERIAL_CONSOLES = "115200;ttyPS1"

IMGRCRY_DEPENDS = "${@'image-recovery-make:do_deploy' if d.getVar('XILINX_WITH_ESW') == 'xsct' else ''}"

EXTRA_IMAGEDEPENDS += "board-id-data"
EXTRA_IMAGEDEPENDS:remove = "virtual/boot-bin u-boot-xlnx-uenv"

IMAGE_FSTYPES += " ext4 wic wic.xz wic.qemu-sd"

KERNEL_COMMAND_APPEND ?= "root=LABEL=root"

UBOOT_MACHINE = "xilinx_zynqmp_kria_defconfig"

MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "${PREFERRED_PROVIDER_virtual/dtb}"

# Default values for deploy dirs
FSBL_DEPLOY_DIR ??= "${DEPLOY_DIR_IMAGE}"
PMU_FIRMWARE_DEPLOY_DIR ??= "${DEPLOY_DIR_IMAGE}"
