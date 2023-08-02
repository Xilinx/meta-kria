# meta-kria

This layer enables AMD Xilinx Kria SOM boards, Evaluation Starter kits and
provides related metadata.

## AMD Xilinx Kria SOM and Evaluation Starter kits BSP Machines files

The following boards are supported by the meta-kria layer:

> **Variable usage examples:**
>
> Machine Configuration file: `MACHINE = "k26-smk-kv"`
>
> Reference XSA: `HDF_MACHINE = "k26-smk-kv"`
>
> HW Board Device tree: `YAML_DT_BOARD_FLAGS = "{BOARD zynqmp-sck-kv-g-revB}"`

| Devices | Kria SOM and Evaluation Starter kits                                                                        | Machine Configuration file                 | Reference XSA | HW Board Device tree   | QEMU tested | HW tested |
|---------|-------------------------------------------------------------------------------------------------------------|--------------------------------------------|---------------|------------------------|-------------|-----------|
| ZynqMP  | [Kria K26 SOM](https://www.xilinx.com/products/som/kria/k26c-commercial.html)                               | [k26-sm](conf/machine/k26-sm.conf)         | `k26-sm`      | `zynqmp-smk-k26-reva`  | Yes         | Yes       |
|         | [Kria KV260 Vision AI Starter Kit](https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit.html)  | [k26-smk-kv](conf/machine/k26-smk-kv.conf) | `k26-smk-kv`  | `zynqmp-sck-kv-g-revB` | Yes         | Yes       |
|         | [Kria KR260 Robotics Starter Kit](https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html) | [k26-smk-kr](conf/machine/k26-smk-kr.conf) | `k26-smk-kr`  | `zynqmp-sck-kr-g-revB` | Yes         | Yes       |
|         | Kria K24 SOM                                                                                                | [k24-sm](conf/machine/k24-sm.conf)         | `k24-km`      | `zynqmp-sm-k24-reva`   | Yes         | Yes       |
|         | Kria KD240 Drives Starter Kit                                                                               | [k24-smk-kd](conf/machine/k24-smk-kd.conf) | `k24-smk-kd`  | `zynqmp-sck-kd-g-revA` | Yes         | Yes       |

> **Note:** Additional information on Xilinx architectures can be found at:
	https://www.xilinx.com/products/silicon-devices.html

## Maintainers, Patches/Submissions, Community

Please send any patches, pull requests, comments or questions for this layer to
the [meta-xilinx mailing list](https://lists.yoctoproject.org/g/meta-xilinx):

	meta-xilinx@lists.yoctoproject.org

When sending patches, please make sure the email subject line includes
`[meta-kria][<BRANCH_NAME>][PATCH]` and cc'ing the maintainers.

For more details follow the OE community patch submission guidelines, as described in:

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

`git send-email --to meta-xilinx@lists.yoctoproject.org *.patch`

> **Note:** When creating patches, please use below format. To follow best practice,
> if you have more than one patch use `--cover-letter` option while generating the
> patches. Edit the `0000-cover-letter.patch` and change the title and top of the
> body as appropriate.

**Syntax:**
`git format-patch -s --subject-prefix="meta-kria][<BRANCH_NAME>][PATCH" -1`

**Example:**
`git format-patch -s --subject-prefix="meta-kria][rel-v2023.1][PATCH" -1`

**Maintainers:**

	Mark Hatle <mark.hatle@amd.com>
	Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
	John Toomey <john.toomey@amd.com>
---
## Dependencies

This layer depends on:

	URI: https://git.yoctoproject.org/poky
	layers: meta, meta-poky
	branch: langdale

	URI: https://git.openembedded.org/meta-openembedded
	layers: meta-oe
	branch: langdale

	URI:
        https://git.yoctoproject.org/meta-xilinx (official version)
        https://github.com/Xilinx/meta-xilinx (development and amd xilinx release)
	layers: meta-xilinx-microblaze, meta-xilinx-core
	branch: langdale or amd xilinx release version (e.g. rel-v2023.1)

	URI:
        https://git.yoctoproject.org/meta-xilinx-tools (official version)
        https://github.com/Xilinx/meta-xilinx-tools (development and amd xilinx release)
	branch: langdale or amd xilinx release version (e.g. rel-v2023.1)

	URI: https://github.com/Xilinx/meta-petalinux
	branch: amd xilinx release version (e.g. rel-v2023.1)

	URI: https://github.com/Xilinx/meta-jupyter
	branch: langdale or amd xilinx release version (e.g. rel-v2023.1)

	URI: https://git.yoctoproject.org/meta-security
	layers: meta-tpm
	branch: langdale
