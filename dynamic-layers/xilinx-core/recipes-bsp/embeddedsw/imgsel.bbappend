do_compile:append() {
    printf "* ${PN}\nSRCREV: ${SRCREV} \nBRANCH: ${BRANCH}\n\n" > ${S}/${PN}.manifest
}

do_deploy:append() {
    install -Dm 0644 ${S}/${PN}.manifest ${DEPLOYDIR}/${XSCTH_BASE_NAME}.manifest
    ln -sf ${XSCTH_BASE_NAME}.manifest ${DEPLOYDIR}/imgsel-${MACHINE}.manifest
}
