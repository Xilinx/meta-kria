require petalinux-image-common-som.inc

# k26 recipes
IMAGE_INSTALL:append:k26 = " packagegroup-petalinux-som"
