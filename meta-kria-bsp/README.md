# meta-kria-bsp

This layer provides the board support metadata for the AMD Kria K24/K26
system-on-modules and the KD240 Drives, KR260 Robotics and KV260 Vision AI
Starter Kits: machine configuration files, machine/domain YAML, system device
trees, multiconfigs, `recipes-bsp` (bootbin, u-boot, device-tree, kria-qspi,
embeddedsw, lm_sensors), board firmware (`recipes-firmware`), OpenAMP firmware
examples under `dynamic-layers` and the machine-generation scripts.

Yocto Project guidelines indicate machines and distro settings should be in
different layers. The Kria machines and related settings are captured in this
layer, while the companion meta-kria-core layer does NOT contain any machine
specific items.

## Maintainers, Mailing list, Patches

See meta-kria README.md file for details on sending patches, and maintainers.

## Dependencies

This layer depends on:

	URI: https://git.openembedded.org/openembedded-core
	layers: meta
	branch: wrynose

	URI:
        https://git.yoctoproject.org/meta-xilinx (official version)
        https://github.com/Xilinx/meta-xilinx (development and AMD release)
	layers: meta-xilinx-core, meta-xilinx-standalone, meta-xilinx-standalone-sdt
	branch: wrynose or AMD release version (e.g. rel-v2026.2)

	URI: https://github.com/Xilinx/meta-kria
	layers: meta-kria-core
	branch: AMD release version (e.g. rel-v2026.2)

Recommended (optional) layers:

	URI:
        https://git.yoctoproject.org/meta-xilinx (official version)
        https://github.com/Xilinx/meta-xilinx (development and AMD release)
	layers: meta-xilinx-virtualization
	branch: wrynose or AMD release version (e.g. rel-v2026.2)

## Note:

* **dynamic-layers vs. LAYERRECOMMENDS**

`conf/layer.conf` in this layer defines `BBFILES_DYNAMIC` entries of the form
`<collection>:<path>/*.bb(append)`. Each entry only takes effect if
`<collection>` is already enabled in the current build; if it isn't, the
corresponding recipes/bbappends under that path are silently skipped.

The `dynamic-layers/openamp-layer` hook reacts to the `openamp-layer`
collection, which is intentionally **not** listed in `LAYERDEPENDS` or
`LAYERRECOMMENDS`: this layer opportunistically adds OpenAMP firmware
examples *if* meta-openamp happens to be part of the build, but does not
require it. The other hook, `dynamic-layers/xilinx-virtualization`, is
covered by `LAYERRECOMMENDS`.

See meta-kria README.md for a longer discussion of this relationship.

## License

Copyright (C) 2021-2026, Advanced Micro Devices, Inc.\
SPDX-License-Identifier: MIT
