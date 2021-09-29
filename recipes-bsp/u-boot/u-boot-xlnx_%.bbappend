SRC_URI:append_k26 = " \
	file://vars \
	file://som_bootmenu.cfg \
	"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_configure:append_k26 () {
	install ${WORKDIR}/vars ${S}/.
}
