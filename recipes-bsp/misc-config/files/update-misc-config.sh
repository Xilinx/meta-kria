#!/bin/sh                                                                       
  
function Get_MAC_ID(){

	local output=""
	local index=$1
	if [ $index -eq 0 ]; then
		output="$(fru-print -b som -f multirecord MAC_Addr MAC_ID_0)"
	else
		output="$(fru-print -b cc -f multirecord MAC_Addr PS_MAC_ID_$index)"
	fi
	echo $output                 
}

function Get_Active_Ethernet(){

	local output=""
	local num=$1
	output=$(ls /sys/class/net | grep eth$num)

	if [ -z "$output" ]; then
		echo "No Ethernet Port Found"
		exit 1
	else
		line=${output:0:4}
		echo "$line"                          
	fi
}

function Update_MAC_Address(){

	i=$(ls -ld /sys/class/net/eth* | wc -l)
	while [ $i -gt 0 ]; do
		i=$(( i - 1 ))
		local eth=$(Get_Active_Ethernet $i)
		local MAC_ID=$(Get_MAC_ID $i)
		/sbin/ifconfig $eth down
		/sbin/ifconfig $eth hw ether $MAC_ID
		/sbin/ifconfig $eth up
		local MAC_addr=$(cat /sys/class/net/$eth/address)
		echo "MAC address for $eth is updated to $MAC_addr"
	done
}

Update_MAC_Address

