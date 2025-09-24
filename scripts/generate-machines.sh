#! /bin/bash

# Use the machineyaml file to refresh the machine
#
# Usage: generate-machines.sh [<layer>] [<machine>]

if [ -n "$1" ]; then
    layer=$(realpath $1)
    if [ ! -d $layer ]; then
        echo "ERROR: The specified layer path does not exist" >&2
        exit 1
    fi
else
    layer=$(dirname $0)/..
    layer=$(realpath $layer)
fi

if [ ! -d $layer/conf/machineyaml ]; then
    echo "ERROR: The layer does not contain a conf/machineyaml directory."
    exit 1
fi

gmc=`which gen-machineconf`
if [ -z "${gmc}" ]; then
  echo "ERROR: This script must be run in a configured Yocto Project build with gen-machineconf in the environment." >&2
  exit 1
fi

gen_machine() {
    machine=$1
    if [ ! -e $layer/conf/machineyaml/$machine.yaml ]; then
        echo "ERROR: Unable to find machine $machine in $layer/conf/machineyaml" >&2
        exit 1
    fi
    machineyaml=$layer/conf/machineyaml/$machine.yaml

    echo
    echo machine: $machine
    echo machineyaml: $machineyaml
    echo ${gmc} --template $machineyaml -c $layer/conf
    ${gmc} --template $machineyaml -c $layer/conf

    # Cleanup tmp files
    rm -rf output hw-description
}

cd $layer/conf/machineyaml
if [ -n "$2" ] ; then
    gen_machine $2
else
    for machineyaml in *.yaml ; do
        gen_machine ${machineyaml/.yaml/}
    done
fi
