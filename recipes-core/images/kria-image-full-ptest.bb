DESCRIPTION += "ptest image for Kria"

# Requires DEBUG_TWEAKS to be enabled in local.conf

inherit features_check
REQUIRED_DISTRO_FEATURES = "ptest"

require kria-image-full-cmdline.bb
IMAGE_CLASSES += "testimage"

require conf/distro/include/ptest-packagelists.inc
#IMAGE_INSTALL += "${PTESTS_FAST}"

TEST_SUITES = "\
    ping \
    ssh \
    date \
    df \
    python \
"

IMAGE_OVERHEAD_FACTOR = "1.0"
IMAGE_ROOTFS_EXTRA_SPACE = "1524288"

TEST_QEMUPARAMS = "-m 4G"

PTEST_EXPECT_FAILURE = "1"
