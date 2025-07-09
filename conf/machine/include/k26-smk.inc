#### Preamble
MACHINEOVERRIDES =. "${@['', 'k26-smk:']['k26-smk' != '${MACHINE}']}"
#### Regular settings follow

YAML_DT_BOARD_FLAGS ?= "{BOARD zynqmp-smk-k26-reva}"

UBOOT_DT_FILES ?= "\
    zynqmp-sck-kr-g-revA.dtso \
    zynqmp-sck-kr-g-revB.dtso \
    zynqmp-sck-kv-g-revA.dtso \
    zynqmp-sck-kv-g-revB.dtso \
    "

require conf/machine/include/k26-kria-common.inc

#### No additional settings should be after the Postamble
#### Postamble
PACKAGE_EXTRA_ARCHS:append = "${@['', ' k26_smk']['k26-smk' != "${MACHINE}"]}"
