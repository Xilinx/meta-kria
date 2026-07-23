# meta-kria

This layer enables AMD Kria SOM boards, Evaluation Starter kits and
provides related metadata.

## Layer structure

This repository is split into two sub-layers, following Yocto layer guidelines:

- `meta-kria-bsp` (collection `kria-bsp`): board support - machine `.conf`, machine/domain YAML, device trees, multiconfigs, `recipes-bsp`, board firmware (`recipes-firmware`), `dynamic-layers` and the machine-generation scripts.
- `meta-kria-core` (collection `kria-core`): machine-independent runtime utilities (`recipes-utils`) and the Kria packagegroup (`recipes-core`), which conditionally includes board firmware from `meta-kria-bsp` when that sub-layer is present.

Add both to `bblayers.conf` (core before bsp):

```
  ##OEROOT##/../meta-kria/meta-kria-core \
  ##OEROOT##/../meta-kria/meta-kria-bsp \
```

## Maintainers, Patches/Submissions, Community

Please send any patches, pull requests, comments or questions for this layer to
the [meta-xilinx mailing list](https://lists.yoctoproject.org/g/meta-xilinx):

	meta-xilinx@lists.yoctoproject.org

When sending patches, please make sure the email subject line includes
`[meta-kria][<BRANCH_NAME>][PATCH]` and cc'ing the maintainers.

For more details follow the Yocto Project community patch submission guidelines,
as described in:

https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#

`git send-email --to meta-xilinx@lists.yoctoproject.org *.patch`

> **Note:** When creating patches, please use below format. To follow best practice,
> if you have more than one patch use `--cover-letter` option while generating the
> patches. Edit the `0000-cover-letter.patch` and change the title and top of the
> body as appropriate.

**Syntax:**
`git format-patch -s --subject-prefix="meta-kria][<BRANCH_NAME>][PATCH" -1`

**Example:**
`git format-patch -s --subject-prefix="meta-kria][rel-v2026.1][PATCH" -1`

**Maintainers:**

	Mark Hatle <mark.hatle@amd.com>
	Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
	John Toomey <john.toomey@amd.com>
	Trevor Woerner <trevor.woerner@amd.com>
---
## Dependencies

This layer depends on:

	URI: https://git.yoctoproject.org/poky
	layers: meta, meta-poky
	branch: scarthgap

	URI: https://git.openembedded.org/meta-openembedded
	layers: meta-oe
	branch: scarthgap

	URI:
        https://git.yoctoproject.org/meta-xilinx (official version)
        https://github.com/Xilinx/meta-xilinx (development and AMD release)
	layers: meta-xilinx-microblaze, meta-xilinx-core, meta-xilinx-standalone
	branch: scarthgap or AMD release version (e.g. rel-v2026.1)

	URI:
        https://git.yoctoproject.org/meta-xilinx-tools (official version)
        https://github.com/Xilinx/meta-xilinx-tools (development and AMD release)
	branch: scarthgap or AMD release version (e.g. rel-v2026.1)

	URI: https://git.yoctoproject.org/meta-security
	layers: meta-tpm
	branch: scarthgap

	URI: https://git.yoctoproject.org/meta-arm
	layers: meta-arm, meta-arm-toolchain
	branch: scarthgap
