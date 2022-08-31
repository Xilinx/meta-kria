# meta-som

This layer provides support for enabling the Xilinx Kria SOM boards and starter kits.

(applications and firmware moved to meta-som-apps)

## Supported Boards/Machines

**Boards/Machines supported by this layer:**

| Platform | Xilinx Board Variant | Machine Configuration file | Board Device tree |
| ---| --- | ---| ---------- |
|ZynqMP|[Kria K26 SOM](https://www.xilinx.com/products/som/kria/k26c-commercial.html)|[k26-som](conf/machine/k26-som.conf)|`zynqmp-smk-k26-reva`|
||[Kria KV260 Vision AI Starter Kit](https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit.html)|[kv260-starter-kit](conf/machine/kv260-starter-kit.conf)|`zynqmp-sck-kv-g-revB`|
||[Kria KR260 Robotics Starter Kit](https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html)|[kr260-starter-kit](conf/machine/kr260-starter-kit.conf)|`zynqmp-sck-kr-g-revB`|

> **Note:** Additional information on Xilinx architectures can be found at:
	https://www.xilinx.com/products/silicon-devices.html

## Maintainers, Patches/Submissions, Community

Please open pull requests for any changes.

For more details follow the OE community patch submission guidelines, as described in:

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

When creating patches, please use below format.

**Syntax:**
`git format-patch -s --subject "meta-som][<release-version>][PATCH" -1`

**Example:**
`git format-patch -s --subject "meta-som][rel-v2022.1][PATCH" -1`

**Maintainers:**

	Mark Hatle <mark.hatle@amd.com>
	Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
	John Toomey <john.toomey@amd.com>

## Dependencies

This layer depends on:

	URI: https://git.openembedded.org/bitbake

	URI: https://git.openembedded.org/openembedded-core
	layers: meta, meta-poky

	URI: https://git.yoctoproject.org/meta-xilinx
	layers: meta-xilinx-microblaze, meta-xilinx-bsp, meta-xilinx-core,
		meta-xilinx-pynq, meta-xilinx-contrib, meta-xilinx-standalone,
		meta-xilinx-vendor.

	URI: https://git.yoctoproject.org/meta-xilinx-tools

	branch: master or xilinx current release version (e.g. hosister)

