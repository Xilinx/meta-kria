#
# Copyright (C) 2023-2025, Advanced Micro Devices, Inc.  All rights reserved.
#
# SPDX-License-Identifier: MIT
#

DESCRIPTION = "Generate a QSPI image for the Kria SOM platform"
SUMMARY = "QSPI image includes image selectors, persistent registers, A/B images and recovery images"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

def spi_inline_kria_regs(d, comp, buf):
    """Generate Kria persistent registers with checksum."""
    idn_reg = int(d.getVar("KRIA_IDN_REG"), 0)
    version_reg = int(d.getVar("KRIA_VERSION_REG"), 0)
    length_reg = int(d.getVar("KRIA_LENGTH_REG"), 0)
    persistent_reg = int(d.getVar("KRIA_PERSISTENT_REG"), 0)
    image_a_offset = int(d.getVar("KRIA_IMAGE_A_OFFSET"), 0)
    image_b_offset = int(d.getVar("KRIA_IMAGE_B_OFFSET"), 0)
    image_rcvry_offset = int(d.getVar("KRIA_IMAGE_RCVRY_OFFSET"), 0)

    p_reg = [idn_reg, version_reg, length_reg, persistent_reg,
             image_a_offset, image_b_offset, image_rcvry_offset]
    checksum = 0xffffffff - (0xffffffff & sum(p_reg))
    p_reg.insert(3, checksum)

    data = b""
    for value in p_reg:
        data += value.to_bytes(4, byteorder="little")
    return data

inherit amd-spi-image deploy image-artifact-names

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:k26-smk-kr-sdt-multidomain = "${MACHINE}"
COMPATIBLE_MACHINE:k26-smk-kv-sdt-multidomain = "${MACHINE}"
COMPATIBLE_MACHINE:k24-smk-kd-sdt-multidomain = "${MACHINE}"

# 64MB QSPI
SPI_IMAGE_SIZE ??= "0x400_0000"

# Output size smaller than flash (SPI_IMAGE_SIZE) for faster programming
#SPI_OUTPUT_SIZE ??= "0x228_0000"

SPI_COMPONENTS = "image_selector persistent_regs bootbin recovery version checksum"

# Image selector - primary, backup, and copies in A/B image slots
SPI_OFFSET[image_selector]  = "0x0 0x8_0000 0xF0_0000 0x1C8_0000"
SPI_SOURCE[image_selector]  = "image-selector-${MACHINE}.bin"

# Persistent registers - primary + backup (inline generated)
SPI_OFFSET[persistent_regs] = "0x10_0000 0x12_0000"
SPI_SOURCE[persistent_regs] = "@inline:kria_regs"

# Boot.bin - A/B slots
SPI_OFFSET[bootbin]  = "0x20_0000 0xF8_0000"
SPI_SOURCE[bootbin]  = "boot.bin"

# Recovery image - primary + backup
SPI_OFFSET[recovery]  = "0x1E0_0000 0x200_0000"
SPI_SOURCE[recovery]  = "image-recovery-${MACHINE}.bin"

# Version string
SPI_OFFSET[version] = "0x224_0000"
SPI_SOURCE[version] = "@inline:version"

# SHA256 checksum of entire image
SPI_OFFSET[checksum] = "0x225_0000"
SPI_SOURCE[checksum] = "@inline:sha256"

# Version configuration
QSPI_VERSION:k26-kria = "2.1"
QSPI_VERSION:k24-kria = "1.1"
SPI_VERSION = "${PN}-${MACHINE}-v${QSPI_VERSION}${IMAGE_VERSION_SUFFIX}"

# Kria persistent registers configuration
KRIA_IDN_REG = "0x4D554241"
KRIA_VERSION_REG = "0x1"
KRIA_LENGTH_REG = "0x4"
KRIA_PERSISTENT_REG = "0x01010000"
KRIA_IMAGE_A_OFFSET = "0x20_0000"
KRIA_IMAGE_B_OFFSET = "0xF8_0000"
KRIA_IMAGE_RCVRY_OFFSET = "0x1E0_0000"

DEPENDS += "virtual/fsbl"
SPI_DEPLOY_DEPENDS = "virtual/imgsel virtual/boot-bin virtual/imgrcry"
do_compile[vardeps] += "KRIA_IDN_REG KRIA_VERSION_REG KRIA_LENGTH_REG KRIA_PERSISTENT_REG \
    KRIA_IMAGE_A_OFFSET KRIA_IMAGE_B_OFFSET KRIA_IMAGE_RCVRY_OFFSET QSPI_VERSION"

do_configure[noexec] = "1"
do_install[noexec] = "1"

do_deploy:append() {
    ln -sf ${IMAGE_NAME}.bin ${DEPLOYDIR}/${SPI_VERSION}.bin
}
