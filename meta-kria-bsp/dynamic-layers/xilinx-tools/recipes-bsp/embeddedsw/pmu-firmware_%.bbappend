YAML_SERIAL_CONSOLE_STDIN:kria ?= "psu_uart_1"
YAML_SERIAL_CONSOLE_STDOUT:kria ?= "psu_uart_1"

YAML_COMPILER_FLAGS:append:k24-kria = " -DK24_SOM"
YAML_COMPILER_FLAGS:append:k26-kria = " -DK26_SOM"
