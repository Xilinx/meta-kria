SUMMARY = "Aibox AA2 application"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=176b9da4a2fc74d2a4b8429e10678580"

BRANCH = "master"
SRC_URI = "git://github.com/Xilinx/aibox-aa2.git;protocol=https;branch=${BRANCH}"
SRCREV = "df021547ebd74fe00113807e5fff8d7fc1df7b03"

inherit cmake

DEPENDS = "ivas-accel-libs glog gstreamer1.0-rtsp-server"
RDEPENDS_${PN} = "ivas-accel-libs vitisai-model"

SOMAPP_INSTALL_PATH = "/"
EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Release -DCMAKE_SYSROOT=${STAGING_DIR_HOST} -DCMAKE_INSTALL_PREFIX=${SOMAPP_INSTALL_PATH} "

S = "${WORKDIR}/git"

FILES_${PN} += " \
	/opt/xilinx \
	/usr \
	"
