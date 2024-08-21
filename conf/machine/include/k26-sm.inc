MACHINEOVERRIDES =. "${@['', 'k26-sm:']['k26-sm' != '${MACHINE}']}"

YAML_DT_BOARD_FLAGS ?= "{BOARD zynqmp-sm-k26-reva}"

require conf/machine/include/k26-kria-common.inc

#### No additional settings should be after the Postamble
#### Postamble
PACKAGE_EXTRA_ARCHS:append = "${@['', ' k26_sm']['k26-sm' != "${MACHINE}"]}"
