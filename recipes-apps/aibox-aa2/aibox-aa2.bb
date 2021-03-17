SUMMARY = "Aibox AA2 application"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c5ded2ac97b4ce01aa0ace8f3a1755"

BRANCH = "master"
SRC_URI = "git://github.com/Xilinx/aibox-aa2.git;protocol=https;branch=${BRANCH}"
SRCREV = "bd62c12b037b20f4dceeae597e405add7bf2d7ed"

inherit cmake

DEPENDS = "ivas-accel-libs glog gstreamer1.0-rtsp-server"
RDEPENDS_${PN} = " \
	gst-perf \
	gstreamer1.0-omx \
	gstreamer1.0-plugins-bad-kms \
	gstreamer1.0-plugins-bad-videoparsersbad \
	gstreamer1.0-plugins-good-multifile \
	gstreamer1.0-plugins-good-rtpmanager \
	gstreamer1.0-plugins-good-rtsp \
	gstreamer1.0-plugins-good-udp \
	gstreamer1.0-python \
	ivas-accel-libs \
	libdrm-tests \
	"

SOMAPP_INSTALL_PATH = "/"
EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Release -DCMAKE_SYSROOT=${STAGING_DIR_HOST} -DCMAKE_INSTALL_PREFIX=${SOMAPP_INSTALL_PATH} "

S = "${WORKDIR}/git"

FILES_${PN} += " \
	/opt/xilinx \
	"
