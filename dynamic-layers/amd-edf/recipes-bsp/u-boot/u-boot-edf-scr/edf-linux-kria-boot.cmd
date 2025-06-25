# This is a boot script for U-Boot and Kria
# Generate edf_linux_kria_boot.scr:
# mkimage -c none -A arm -T script -d edf-linux-kria-boot.cmd edf_linux_kria_boot.scr
#
################

setenv kernelname Image

setenv bootpartnum 2
setenv rootpartnum 3

setenv ramdisk_name @@RAMDISK_IMAGE1@@
setenv ramdisk_addr @@RAMDISK_IMAGE_ADDRESS@@

# Close pmufw node so that linux can't send small fragments to pmufw
zynqmp pmufw node close

# Get the default DTB bootargs
fdt addr ${fdtcontroladdr}
fdt get value bootargs /chosen bootargs

# k24 Starter Kit default boot args
if test "${board_name}" = "${k24_starter}"; then
	setenv bootargs earlycon console=ttyPS1,115200 init_fatal_sh=1 cma=512M ;
# k26 Starter Kit default boot args
else test "${board_name}" = "${k26_starter}";
	setenv bootargs earlycon console=ttyPS1,115200 init_fatal_sh=1 cma=800M ;
fi

#Set boot parameters based on CC type
if test "${card1_name}" = "SCK-KR-G"; then
	setenv bootargs xilinx_tsn_ep.st_pcp=4 $bootargs ;
else test "${card1_name}" = "SCK-KD-G";
        setenv bootargs xilinx_tsn_ep.st_pcp=4 $bootargs ;
fi

echo "Checking for kernel:${kernelname}"
if test -e ${devtype} ${devnum}:${bootpartnum} ${kernelname}; then
	echo "Loading ${kernelname} at ${kernel_addr_r}" ;
	ext4load ${devtype} ${devnum}:${bootpartnum} ${kernel_addr_r} ${kernelname} ;
else
	echo "kernel image ${kernelname} not found on ${devtype} ${devnum}:${bootpartnum}" ;
	exit ;
fi

part uuid ${devtype} ${devnum}:${rootpartnum} rootpart_uuid

setenv bootargs ${bootargs} root=PARTUUID=${rootpart_uuid} ro rootwait uio_pdrv_genirq.of_id=generic-uio

if test -e ${devtype} ${devnum}:${bootpartnum} /${ramdisk_name} && test "${skip_tinyramdisk}" != "yes"; then
	echo "Loading initramfs ${ramdisk_name} at ${ramdisk_addr}" ;
	load ${devtype} ${devnum}:${bootpartnum} ${ramdisk_addr} ${ramdisk_name} ;
	booti ${kernel_addr_r} ${ramdisk_addr} ${fdtcontroladdr} ;
fi

booti ${kernel_addr_r} - ${fdtcontroladdr}
