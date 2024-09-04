do_compile:append:kria() {
    printf  "* ${PN}\nSRCREV: ${SRCREV}\nBRANCH: ${BRANCH}\n\n" > ${S}/${PN}.manifest
}

do_deploy:append:kria() {
    install -m 0644 ${S}/${PN}.manifest ${DEPLOYDIR}/${ATF_BASE_NAME}.manifest
    ln -sf ${ATF_BASE_NAME}.manifest ${DEPLOYDIR}/${PN}.manifest
}
