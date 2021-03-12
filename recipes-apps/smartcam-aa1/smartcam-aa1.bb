SUMMARY = "Smartcamera AA1 application"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=176b9da4a2fc74d2a4b8429e10678580"

BRANCH = "master"
SRC_URI = "git://github.com/Xilinx/smartcam-aa1.git;protocol=https;branch=${BRANCH}"
SRCREV = "5479291e60f4a3d5490a3b2dd7f6363d10d6dd54"

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
