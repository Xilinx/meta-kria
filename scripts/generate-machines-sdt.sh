#! /bin/bash -e

# Compatibility script for anyone still using generate-machines-sdt.sh
# $0: <conf_path> <machine_url_index> [machine]

this=$(realpath $0)
if [ -n "$1" ]; then
  layer_path=$(realpath $1/..)
else
  layer_path=$(dirname $this)
  layer_path=$(dirname $layer_path)
fi

if [ -n "$2" ]; then
  echo
  echo INFO: Updating machineyaml URLs...
  echo
  $(dirname $this)/update-machineyaml.sh $2 $layer_path $3
fi

echo
echo INFO: Generating new machines...
echo
$(dirname $this)/generate-machines.sh $layer_path $3
