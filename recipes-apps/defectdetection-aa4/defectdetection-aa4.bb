SUMMARY = "SOM DEFECTDETECTION AA4"
DESCRIPTION = "This application and Kernel library is used to detect the defect of Mango"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c6446fe04523e7cc1f7446f936bc879b"

BRANCH ?= "master"

inherit cmake

DEPENDS = "ivas-accel-libs glog"
RDEPENDS_${PN} = " \
    gst-perf \
    gstreamer1.0-plugins-bad-kms \
    gstreamer1.0-plugins-bad-mediasrcbin \
    gstreamer1.0-plugins-bad-videoparsersbad \
    gstreamer1.0-plugins-good-multifile \
    gstreamer1.0-plugins-good-video4linux2 \
    gstreamer1.0-python \
    ivas-accel-libs \
    v4l-utils \
    "

S = "${WORKDIR}/git"

SRC_URI += " \
    git://github.com/Xilinx/defectdetection_aa4.git;branch=${BRANCH};protocol=https \
    "
SRCREV ?= "bb1ca9164e01cf0a539648753b0a3c344176d19f"

SOMAPP_INSTALL_PATH = "/"

EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Release -DCMAKE_SYSROOT=${STAGING_DIR_HOST} -DCMAKE_INSTALL_PREFIX=${SOMAPP_INSTALL_PATH} "

FILES_${PN} += " \
    /opt/xilinx \
    "
