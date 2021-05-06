SUMMARY = "Aibox ReID application"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c5ded2ac97b4ce01aa0ace8f3a1755"

BRANCH = "release-2020.2.2_k26"
SRC_URI = "git://github.com/Xilinx/aibox-reid.git;protocol=https;branch=${BRANCH}"
SRCREV = "cd56216402cad4928a4057fa62ebf816d7205a77"

inherit cmake

DEPENDS = "ivas-accel-libs glog gstreamer1.0-rtsp-server"
RDEPENDS_${PN} = " \
	gst-perf \
	gstreamer1.0-omx \
	gstreamer1.0-plugins-bad-kms \
	gstreamer1.0-plugins-bad-videoparsersbad \
	gstreamer1.0-plugins-good-multifile \
	gstreamer1.0-plugins-good-rtp \
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
