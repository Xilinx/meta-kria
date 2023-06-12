#### Preamble
MACHINEOVERRIDES =. "${@['', 'k24-smk:']['k24-smk' != '${MACHINE}']}"
#### Regular settings follow

YAML_DT_BOARD_FLAGS ?= "{BOARD zynqmp-smk-k24-reva}"

UBOOT_DT_FILES ?= "\
    zynqmp-sck-kd-g-revA.dts \
    zynqmp-sck-kv-g-revA.dts \
    zynqmp-sck-kv-g-revB.dts \
    "

require conf/machine/include/k24-kria-common.inc

HDF_MACHINE = "k24-smk"

#### No additional settings should be after the Postamble
#### Postamble
PACKAGE_EXTRA_ARCHS:append = "${@['', ' k24_smk']['k24-smk' != "${MACHINE}"]}"
