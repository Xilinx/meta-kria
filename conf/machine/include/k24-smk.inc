#### Preamble
MACHINEOVERRIDES =. "${@['', 'k24-smk:']['k24-smk' != '${MACHINE}']}"
#### Regular settings follow

UBOOT_DT_FILES ?= "\
    zynqmp-sck-kd-g-revA.dtso \
    zynqmp-sck-kv-g-revA.dtso \
    zynqmp-sck-kv-g-revB.dtso \
    "


require conf/machine/include/k24-kria-common.inc

EXTRA_IMAGEDEPENDS += "kria-qspi"

#### No additional settings should be after the Postamble
#### Postamble
PACKAGE_EXTRA_ARCHS:append = "${@['', ' k24_smk']['k24-smk' != "${MACHINE}"]}"
