#!/bin/sh

function get_MAC_address(){
	local __output=$1
        eval $__output="'$(fru-print.py -b som -f multirecord MAC_Addr MAC_ID_0 | sed 's/../\:&/2g' | sed 's/://')'"
}

function update_MAC_address(){

        get_MAC_address MAC_addr
        ifconfig eth0 down
        ifconfig eth0 hw ether $MAC_addr
	ifconfig eth0 up
        echo "MAC address for eth0 is updated to $MAC_addr"
}
update_MAC_address
