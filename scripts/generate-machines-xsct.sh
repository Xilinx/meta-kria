#! /bin/bash -e

XSCT_VERSION=2025.1

### The following table controls the automatic generated of the machine .conf files (lines start with #M#)
### Machine
#M# k24c-sm
#M# k24i-sm
#M# k24-smk
#M# k24-smk-kd
#M# k26-sm
#M# k26-smk
#M# k26-smk-kr
#M# k26-smk-kv

this=$(realpath $0)

if [ $# -lt 2 ]; then
  echo "$0: <conf_path> <machine_url_index> [machine]" >&2
  exit 1
fi

conf_path=$(realpath $1)

mach_index=$(realpath $2)
count=0
while read mach_id mach_url; do
  if [ ${mach_id} = '#' ]; then
      continue
  fi

  MACHINE_ID[$count]=${mach_id}
  MACHINE_URL[$count]=${mach_url}

  count=$(expr $count + 1)
done < ${mach_index}


# Load in the arrays from this script
count=0
while read marker machine; do
  if [ "${marker}" != "#M#" ]; then
      continue
  fi

  MACHINES[$count]=${machine}
  for mach in ${!MACHINE_ID[@]}; do
    if [ ${MACHINE_ID[${mach}]} = ${machine} ]; then
      URLS[$count]=${MACHINE_URL[${mach}]}
      break
    fi
  done
  if [ -z "${URLS[$count]}" ]; then
    echo "ERROR: Unable to find ${machine} in ${mach_index}" >&2
    exit 1
  fi
  count=$(expr $count + 1)
done < ${this}


for mach in ${!MACHINES[@]}; do
  if [ -n "$3" -a "$3" != "${MACHINES[${mach}]}" ]; then
    continue
  fi

  echo "Machine: ${MACHINES[${mach}]}"
  echo "URL:     ${URLS[${mach}]}"
  echo
  if [ ! -e ${conf_path}/machine/${MACHINES[${mach}]}.conf ]; then
    echo "ERROR: Unable to find ${conf_path}/machine/${MACHINES[${mach}]}.conf to modify" >&2
    exit 1
  fi

  url=${URLS[${mach}]}
  url=$(echo $url | sed 's,https://petalinux.xilinx.com/sswreleases/.*/hdf-examples,https://artifactory.xilinx.com/artifactory/petalinux-hwproj-dev/hdf-examples,')

  wget $url -O ${conf_path}/machine/output.xsa
  sha=$(sha256sum ${conf_path}/machine/output.xsa | cut -d ' ' -f 1)
  rm -f ${conf_path}/machine/output.xsa

  printf "HDF_URI = '%s'\n" ${URLS[${mach}]} >> ${conf_path}/machine/output.cfg
  printf "HDF_URI[sha256sum] = '%s'\n" ${sha} >> ${conf_path}/machine/output.cfg

  mv ${conf_path}/machine/${MACHINES[${mach}]}.conf ${conf_path}/machine/${MACHINES[${mach}]}.conf.orig
  cat ${conf_path}/machine/${MACHINES[${mach}]}.conf.orig | grep -v "HDF_URI" > ${conf_path}/machine/${MACHINES[${mach}]}.conf

  if grep -q "# Add system XSA" ${conf_path}/machine/${MACHINES[${mach}]}.conf ; then
    sed -i "/^# Add system XSA/r ${conf_path}/machine/output.cfg" ${conf_path}/machine/${MACHINES[${mach}]}.conf
  else
    echo "# Add system XSA" >> ${conf_path}/machine/${MACHINES[${mach}]}.conf
    cat ${conf_path}/machine/output.cfg >> ${conf_path}/machine/${MACHINES[${mach}]}.conf
  fi

  rm -f ${conf_path}/machine/${MACHINES[${mach}]}.conf.orig ${conf_path}/machine/output.cfg
done
