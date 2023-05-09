KRIA_ADDITIONAL_INCLUDE = ""

# The settings in this include change the boot script used by u-boot but this should only be done
# when building for k26-smk and not other machine configs which may inherit this MACHINEOVERRIDE
KRIA_ADDITIONAL_INCLUDE:k26-smk = "${@'kria-boot-cmd.inc' if d.getVar('MACHINE') == 'k26-smk' else ''}"
KRIA_ADDITIONAL_INCLUDE:k24-smk = "${@'kria-boot-cmd.inc' if d.getVar('MACHINE') == 'k24-smk' else ''}"

include ${KRIA_ADDITIONAL_INCLUDE}
