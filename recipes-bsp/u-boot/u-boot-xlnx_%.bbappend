SRC_URI:append:k26 = " \
	file://vars \
	file://som_bootmenu.cfg \
	"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_configure:append:k26 () {
	install ${WORKDIR}/vars ${S}/.
}
