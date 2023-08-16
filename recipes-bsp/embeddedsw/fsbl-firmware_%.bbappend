do_compile:append:kria() {
    printf "* ${PN}\nSRCREV: ${SRCREV}\nBRANCH: ${BRANCH}\n\n" > ${S}/${FSBL_BASE_NAME}.manifest
}

do_deploy:append:kria() {
    install -m 0644 ${S}/${FSBL_BASE_NAME}.manifest ${DEPLOYDIR}/
    ln -sf ${FSBL_BASE_NAME}.manifest ${DEPLOYDIR}/${FSBL_IMAGE_NAME}.manifest
}
