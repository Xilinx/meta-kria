# AMD Kria SOM and Evaluation Starter kits BSP Machines files

The following boards are supported by the meta-xilinx-tools layer. Eval board SDT
or XSCT (Software Command-Line Tool) BSP machine configuration files are generated
using meta-kria/scripts/generate-machines-{sdt|xsct}.sh scripts.

The following boards are supported by the meta-kria layer:

> **Variable usage examples:**
>
> Machine Configuration file: `MACHINE = "k26-smk-kv"`
>
> HW Board Device tree: `YAML_DT_BOARD_FLAGS = "{BOARD zynqmp-sck-kv-g-revB}"`

| Devices | Kria SOM and Evaluation Starter kits                                                                        | Machine Configuration file                 | Reference XSA | Reference SDT | HW Board Device tree   | QEMU tested | HW tested |
|---------|-------------------------------------------------------------------------------------------------------------|--------------------------------------------|---------------|------------------------|-------------|-----------|-----------|
| ZynqMP  | [Kria K26 SOM](https://www.amd.com/en/products/system-on-modules/kria/k26/k26c-commercial.html)                               | [k26-sm](conf/machine/k26-sm.conf)         | `k26-sm`      | NA      | `zynqmp-sm-k26-reva`   | Yes         | Yes       |
|         |                                | [k26-sm-sdt](conf/machine/k26-sm-sdt.conf)         | NA      | `k26-sm`      | `zynqmp-sm-k26-reva`   | Yes         | Yes       |
|         | [Kria KV260 Vision AI Starter Kit](https://www.amd.com/en/products/system-on-modules/kria/k26/kv260-vision-starter-kit.html)  | [k26-smk-kv](conf/machine/k26-smk-kv.conf) | `k26-smk-kv`  | NA | `zynqmp-sck-kv-g-revB` | Yes         | Yes       |
|         |  | [k26-smk-kv-sdt](conf/machine/k26-smk-kv-sdt.conf) | NA  | `k26-smk-kv` | `zynqmp-sck-kv-g-revB` | Yes         | Yes       |
|         | [Kria KR260 Robotics Starter Kit](https://www.amd.com/en/products/system-on-modules/kria/k26/kr260-robotics-starter-kit.html) | [k26-smk-kr](conf/machine/k26-smk-kr.conf) | `k26-smk-kr`  | NA | `zynqmp-sck-kr-g-revB` | Yes         | Yes       |
|         |  | [k26-smk-kr-sdt](conf/machine/k26-smk-kr-sdt.conf) | NA  | `k26-smk-kr` | `zynqmp-sck-kr-g-revB` | Yes         | Yes       |
|         | [Kria K24c SOM](https://www.amd.com/en/products/system-on-modules/kria/k24/k24c-commercial.html)                              | [k24c-sm](conf/machine/k24c-sm.conf)       | `k24c-sm`     | NA     | `zynqmp-sm-k24-reva`   | Yes         | Yes       |
|         |  | [k24c-sm-sdt](conf/machine/k24c-sm-sdt.conf)       | NA    | `k24c-sm`     | `zynqmp-sm-k24-reva`   | Yes         | Yes       |
|         | [Kria K24i SOM](https://www.amd.com/en/products/system-on-modules/kria/k24/k24i-industrial.html)                              | [k24i-sm](conf/machine/k24i-sm.conf)       | `k24i-sm`     | NA     | `zynqmp-sm-k24-reva`   | Yes         | Yes       |
|         |  | [k24i-sm-sdt](conf/machine/k24i-sm-sdt.conf)       | NA     | `k24i-sm`     | `zynqmp-sm-k24-reva`   | Yes         | Yes       |
|         | [Kria KD240 Drives Starter Kit](https://www.amd.com/en/products/system-on-modules/kria/k24/kd240-drives-starter-kit.html)     | [k24-smk-kd](conf/machine/k24-smk-kd.conf) | `k24-smk-kd`  | NA  | `zynqmp-sck-kd-g-revA` | Yes         | Yes       |
|         |  | [k24-smk-kd-sdt](conf/machine/k24-smk-kd-sdt.conf) | NA  | `k24-smk-kd`  | `zynqmp-sck-kd-g-revA` | Yes         | Yes       |

**Commercial and Industrial grades**
For both K26 and K24 there are C (commercial) and I (industrial) grades of the
production (-sm) SOM. The K26 SOM has no practical software difference between
the two grades so a single machine is supported. However, for K24 the Industrial
grade supports ECC memory but the Commercial grade do not so two machine
configurations are provided.

> **Note:** Additional information on AMD Adaptive SoC's and FPGA's can be found at:
	https://www.amd.com/en/products/adaptive-socs-and-fpgas.html

## Kria XSCT Build Instructions

Follow [XSCT Build Instructions](https://github.com/Xilinx/meta-xilinx-tools/blob/master/README.xsct.bsp.md)

## Kria SDT Build Instructions

Follow [SDT Build Instructions](https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-standalone-sdt/README.sdt.bsp.md)
