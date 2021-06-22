#!/bin/sh                                                                       
                                                                                
function Get_MAC_ID(){                                                     
         local output=""                                                        
         output="$(fru-print.py -b som -f multirecord MAC_Addr MAC_ID_0)" 
         echo $output                 
}                                     
                                      
function Get_Active_Ethernet(){           
                                      
	local output=""                       
	output=$(ls /sys/class/net | grep eth)
                                 
	if [ -z "$output" ]              
	then                                     
        	echo "No Ethernet Port Found"
		exit 1	
	else                                     
        	line=${output:0:4}                    
        	echo "$line"                          
	fi                                                         
} 


function Update_MAC_Address(){

        local MAC_ID=$(Get_MAC_ID)
        local eth=$(Get_Active_Ethernet)
        /sbin/ifconfig $eth down
        /sbin/ifconfig $eth hw ether $MAC_ID
        /sbin/ifconfig $eth up
	local MAC_addr=$(cat /sys/class/net/$eth/address)
        echo "MAC address for $eth is updated to $MAC_addr"
}

Update_MAC_Address
