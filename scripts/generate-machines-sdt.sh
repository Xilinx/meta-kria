#! /bin/bash -e

# Compatibility script for anyone still using generate-machines-sdt.sh

this=$(realpath $0)

if [ $# -lt 2 ]; then
  echo "$0: <conf_path> <machine_url_index> [machine]" >&2
  exit 1
fi

echo
echo INFO: Updating machineyaml URLs...
echo
$(dirname $this)/update-machineyaml.sh $2 $(realpath $1/..) $3

echo
echo INFO: Generating new machines...
echo
$(dirname $this)/generate-machines.sh $(realpath $1/..) $3
