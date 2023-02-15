MACHINEOVERRIDES =. "k26-kria:"

MACHINE_HWCODECS = "libomxil-xlnx"

require conf/machine/zynqmp-ev-generic.conf
require conf/machine/include/kria-common.inc

QB_OPT_APPEND += "-hw-dtb ${DEPLOY_DIR_IMAGE}/qemu-hw-devicetrees/multiarch/board-zynqmp-k26-starterkit-virt.dtb"
