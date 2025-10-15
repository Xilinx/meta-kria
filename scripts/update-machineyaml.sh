#! /bin/bash

# Update the hw-description url in the machineyaml files against an index
#
# Usage: update-machineyaml.sh <index> [<layer>] [<machine>]

if [ -z "$1" ]; then
    echo "ERROR: Must specify the path to an index file" >&2
    exit 1
fi
index=$(realpath $1)

if [ -n "$2" ]; then
    layer=$(realpath $2)
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

update_yaml() {
    machine=$1
    if [ ! -e $layer/conf/machineyaml/$machine.yaml ]; then
        echo "ERROR: Unable to find machine $machine in $layer/conf/machineyaml" >&2
        exit 1
    fi
    machineyaml=$layer/conf/machineyaml/$machine.yaml

    echo
    echo machineyaml: $layer/conf/machineyaml/$machineyaml
    echo machine: $machine

    hwurl=$(grep '^'$machine' ' $index | cut -d ' ' -f 2)
    if [ -z "$hwurl" ]; then
        echo "WARNING: Unable to find $machine in the index, skipping..." >&2
        return
    fi

    echo "url: $hwurl"
    sed -i $machineyaml -e 's,--hw-description .*,--hw-description '$hwurl','
}

cd $layer/conf/machineyaml
if [ -n "$3" ]; then
    update_yaml $3
else
    for machineyaml in * ; do
        update_yaml ${machineyaml/.yaml/}
    done
fi
