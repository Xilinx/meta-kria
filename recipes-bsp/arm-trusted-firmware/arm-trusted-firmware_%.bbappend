do_compile:append:kria() {
    echo "---------------- ${PN} ----------------" > ${S}/${ATF_BASE_NAME}.manifest
    echo "SRCREV: ${SRCREV} \nBRANCH: ${BRANCH}\n" >> ${S}/${ATF_BASE_NAME}.manifest
}

do_deploy:append:kria() {
    install -m 0644 ${S}/${ATF_BASE_NAME}.manifest ${DEPLOYDIR}/
    ln -sf ${ATF_BASE_NAME}.manifest ${DEPLOYDIR}/${PN}.manifest
}
