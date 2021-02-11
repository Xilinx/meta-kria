SRC_URI_append_k26 = " \
	file://vars \
	file://som_bootmenu.cfg \
	"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

do_configure_append_k26 () {
	install ${WORKDIR}/vars ${S}/.
}
