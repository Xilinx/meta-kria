COMPATIBLE_MACHINE:kria = ".*"

FILESEXTRAPATHS:append := ":${THISDIR}/u-boot-edf-scr"

SRC_URI:append:kria = "file://edf-linux-kria-boot.cmd"

# We need to define the initrd filename and load address
# This is from meta-xilinx-core's u-boot-xlnx-scr
RAMDISK_IMAGE1 ?= "ramdisk.cpio.gz.u-boot"

RAMDISK_IMAGE_ADDRESS ?= "${@append_baseaddr(d,d.getVar('RAMDISK_OFFSET'))}"

RAMDISK_OFFSET_DEFAULT ??= ""
RAMDISK_OFFSET_DEFAULT:zynqmp ??= "0x4000000"
RAMDISK_OFFSET ??= "${RAMDISK_OFFSET_DEFAULT}"

#Make this value to "1" to skip appending base address to ddr offsets.
SKIP_APPEND_BASEADDR ?= "0"
DDR_BASEADDR ?= "0x0"

def append_baseaddr(d,offset):
    skip_append = d.getVar('SKIP_APPEND_BASEADDR') or ""
    if skip_append == "1":
        return offset
    if offset.startswith('$'):
        # If offset startswith '$' Assuming as uboot env variable.
        return offset
    import subprocess
    baseaddr = d.getVar('DDR_BASEADDR') or "0x0"
    subcmd = "$((%s+%s));" % (baseaddr,offset)
    cmd = "printf '0x%08x' " + str(subcmd)
    output = subprocess.check_output(cmd, shell=True).decode("utf-8")
    return output

do_compile:append:kria() {
    # Replace the default with our kria version
    rm boot.scr

    sed -e 's/@@RAMDISK_IMAGE1@@/${RAMDISK_IMAGE1}/' \
        -e 's/@@RAMDISK_IMAGE_ADDRESS@@/${RAMDISK_IMAGE_ADDRESS}/' \
        ${WORKDIR}/edf-linux-kria-boot.cmd > ${WORKDIR}/edf-linux-kria-boot-sed.cmd

    mkimage -A arm -T script -C none -n "Linux Kria Boot script" -d "${WORKDIR}/edf-linux-kria-boot-sed.cmd" boot.scr
}
