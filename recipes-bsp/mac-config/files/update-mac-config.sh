#!/bin/sh                                                                       

Get_MAC_ID(){
    if [ "$1" -eq 0 ] || [ "$1" -eq 1 ]; then
        eeprom=$(ls "/sys/bus/i2c/devices/1-005${1}/eeprom" 2> /dev/null)
        output=$(ipmi-fru --fru-file="${eeprom}" --interpret-oem-data 2> /dev/null | awk -F": " '/^  *FRU OEM MAC ID 0*/ { print ($2); exit }')
    fi

    echo "$output"
}

Get_Active_Ethernet(){
    interface=$(find /sys/class/net -name "eth${1}" -exec basename {} \;)
    if [ -z "$interface" ]; then
        echo "No Ethernet Port Found"
        exit 1
    fi

    echo "$interface"
}

Update_MAC_Address(){
    i=$(find /sys/class/net/ -name "eth*" | wc -l)

    while [ "$i" -gt 0 ]; do
        i=$(( i - 1 ))
        eth=$(Get_Active_Ethernet $i)
        MAC_ID=$(Get_MAC_ID $i)
        /sbin/ifconfig "$eth" down
        /sbin/ifconfig "$eth" hw ether "$MAC_ID"
        /sbin/ifconfig "$eth" up
        MAC_addr=$(cat "/sys/class/net/$eth/address")
        echo "mac-config: MAC address for $eth is updated to $MAC_addr"
    done
}

Update_MAC_Address
