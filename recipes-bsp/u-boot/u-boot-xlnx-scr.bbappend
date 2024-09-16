KRIA_ADDITIONAL_INCLUDE = ""

# The settings in this include change the boot script used by u-boot but this should only be done
# when building for k26-smk and not other machine configs which may inherit this MACHINEOVERRIDE
KRIA_ADDITIONAL_INCLUDE:k26-smk = "${@'kria-boot-cmd.inc' if d.getVar('MACHINE') in ('k26-smk', 'k26-smk-sdt') else ''}"
KRIA_ADDITIONAL_INCLUDE:k24-smk = "${@'kria-boot-cmd.inc' if d.getVar('MACHINE') in ('k24-smk', 'k24-smk-sdt') else ''}"
KRIA_ADDITIONAL_INCLUDE:k26-sm = "${@'kria-boot-cmd.inc' if d.getVar('MACHINE') in ('k26-sm', 'k26-sm-sdt') else ''}"
KRIA_ADDITIONAL_INCLUDE:k24i-sm = "${@'kria-boot-cmd.inc' if d.getVar('MACHINE') in ('k24i-sm', 'k24i-sm-sdt') else ''}"
KRIA_ADDITIONAL_INCLUDE:k24c-sm = "${@'kria-boot-cmd.inc' if d.getVar('MACHINE') in ('k24c-sm', 'k24c-sm-sdt') else ''}"
KRIA_ADDITIONAL_INCLUDE:kria-zynqmp-generic = "${@'kria-boot-cmd.inc' if d.getVar('MACHINE') == 'kria-zynqmp-generic' else ''}"

include ${KRIA_ADDITIONAL_INCLUDE}

KERNEL_ROOT_RAMDISK:k26-smk-kv = ""
KERNEL_ROOT_RAMDISK:k26-smk-kr = ""
KERNEL_ROOT_RAMDISK:k24-smk-kd = ""
