YAML_SERIAL_CONSOLE_STDIN:k26 ?= "psu_uart_1"
YAML_SERIAL_CONSOLE_STDOUT:k26 ?= "psu_uart_1"
YAML_COMPILER_FLAGS:append:k26 ?= "-DFSBL_DEBUG"

# QEMU for the Kria SOM requires a section from the FSBL to be extracted

FSBL_DEFAULT_NAME = "executable.elf"
PMU_CONF_NAME = "pmu-conf.bin"

do_compile:append:k26-som () {
    aarch64-none-elf-objcopy --dump-section .sys_cfg_data=../${PMU_CONF_NAME} ${FSBL_DEFAULT_NAME}
}

do_deploy:append:k26-som () {
    install -Dm 0644 ${B}/${PMU_CONF_NAME} ${DEPLOYDIR}/${PMU_CONF_NAME}
}
