#### Preamble
MACHINEOVERRIDES =. "${@['', 'k24-sm:']['k24-sm' != '${MACHINE}']}"
#### Regular settings follow

YAML_DT_BOARD_FLAGS ?= "{BOARD zynqmp-sm-k24-reva}"

require conf/machine/include/k24-kria-common.inc

#### No additional settings should be after the Postamble
#### Postamble
PACKAGE_EXTRA_ARCHS:append = "${@['', ' k24_sm']['k24-sm' != "${MACHINE}"]}"
