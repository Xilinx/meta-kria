do_compile:append:kria() {
    printf "* ${PN}\nSRCREV: ${SRCREV}\nBRANCH: ${BRANCH}\n\n" > ${S}/${PMU_FIRMWARE_BASE_NAME}.manifest
}

do_deploy:append:kria() {
    install -m 0644 ${S}/${PMU_FIRMWARE_BASE_NAME}.manifest ${DEPLOYDIR}/
    ln -sf ${PMU_FIRMWARE_BASE_NAME}.manifest ${DEPLOYDIR}/${PMU_FIRMWARE_IMAGE_NAME}.manifest
}
