# meta-kria-core

This layer provides the machine-independent metadata for AMD Kria SOM boards
and Evaluation Starter Kits. It contains the runtime utilities (`xmutil`,
`xlnx-platformstats`, `axi-qos`, `ddr-qos`, `kria-dashboard`) under
`recipes-utils` and the Kria packagegroup under `recipes-core`, which
conditionally includes board firmware from meta-kria-bsp when that sub-layer
is present.

Yocto Project guidelines indicate machine specific settings should live in a
separate layer, so all board support content is kept in the companion
meta-kria-bsp layer instead.

## Maintainers, Mailing list, Patches

See meta-kria README.md file for details on sending patches, and maintainers.

## Dependencies

This layer depends on:

	URI: https://git.openembedded.org/openembedded-core
	layers: meta
	branch: wrynose

	URI: https://git.openembedded.org/meta-openembedded
	layers: meta-oe, meta-python
	branch: wrynose

	URI:
        https://git.yoctoproject.org/meta-xilinx (official version)
        https://github.com/Xilinx/meta-xilinx (development and AMD release)
	layers: meta-xilinx-core
	branch: wrynose or AMD release version (e.g. rel-v2026.2)

Recommended (optional) layers:

	URI: https://github.com/Xilinx/meta-jupyter
	layers: meta-jupyter
	branch: AMD release version (e.g. rel-v2026.2)

	URI:
        https://github.com/OpenAMP/meta-openamp (official version)
        https://github.com/Xilinx/meta-openamp (development and AMD release)
	branch: wrynose or AMD release version (e.g. rel-v2026.2)

## License

Copyright (C) 2021-2026, Advanced Micro Devices, Inc.\
SPDX-License-Identifier: MIT
