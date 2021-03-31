#!/bin/sh

manufacturer=$(fru-print.py -b cc -f manufacturer)
som_name=$(fru-print.py -b som -f product)
carrier_card=$(fru-print.py -b cc -f product | tr '[:upper:]' '[:lower:]')
cc_rev=$(fru-print.py -b cc -f revision)

dtbo_path="/boot/devicetree/"
dtbo_file="zynqmp-$carrier_card-rev$cc_rev.dtbo"

echo "SOM:$som_name CARRIER_CARD:$carrier_card REVISION:$cc_rev "
if [ -f ${dtbo_path}/$dtbo_file ]; then
	overlay_path="/configfs/device-tree/overlays/"
	echo "Applying $dtbo_file"
	[ ! -d "/configfs" ] && mkdir /configfs
	mount -t configfs configfs /configfs
	cd $overlay_path
	[ ! -d "./full" ] && mkdir full
	[ ! -d "/lib/firmware" ] && mkdir /lib/firmware/
	cp ${dtbo_path}/$dtbo_file /lib/firmware/.
	echo -n "$dtbo_file" > full/path
else
	echo "NO CARRIER DTBO FOUND, PLEASE CHECK $dtbo_path"
fi
