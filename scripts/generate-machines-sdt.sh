#! /bin/bash -e

### The following table controls the automatic generated of the machine .conf files (lines start with #M#)
### Machine          BOARD                     OVERLAY    PRE     POST
#M# k24c-sm-sdt      include/k24-sm.inc        full       none    
#M# k24i-sm-sdt      include/k24-sm.inc        full       none    
#M# k24-smk-kd-sdt   include/k24-smk.inc       full       none    INITRAMFS_IMAGE ?= \"petalinux-initramfs-image\"\\nUBOOT_DT_FILES = \"zynqmp-sck-kd-g-revA.dtso\"\\nDTB_FILE_NAME:task-install:pn-device-tree = \"\${UBOOT_DTFILE_PREFIX}-zynqmp-sck-kd-g-revA.dtb\"\\nDTB_FILE_NAME:task-deploy:pn-device-tree = \"\${UBOOT_DTFILE_PREFIX}-zynqmp-sck-kd-g-revA.dtb\"\\nPR:append:pn-device-tree = \".1\"\\n
#M# k24-smk-sdt      include/k24-smk.inc       full       none    
#M# k26-smk-kr-sdt   include/k26-smk.inc       full       none    require conf/machine/include/kria-qemu-kr.inc\\n\\nINITRAMFS_IMAGE ?= \"petalinux-initramfs-image\"\\nUBOOT_DT_FILES = \"\\\\\\n    zynqmp-sck-kr-g-revA.dtso \\\\\\n    zynqmp-sck-kr-g-revB.dtso \\\\\\n    \"\\nDTB_FILE_NAME:task-install:pn-device-tree = \"\${UBOOT_DTFILE_PREFIX}-zynqmp-sck-kr-g-revB.dtb\"\\nDTB_FILE_NAME:task-deploy:pn-device-tree = \"\${UBOOT_DTFILE_PREFIX}-zynqmp-sck-kr-g-revB.dtb\"\\nPR:append:pn-device-tree = \".1\"\\n
#M# k26-smk-kv-sdt   include/k26-smk.inc       full       none    require conf/machine/include/kria-qemu-kv.inc\\n\\nINITRAMFS_IMAGE ?= \"petalinux-initramfs-image\"\\nUBOOT_DT_FILES = \"\\\\\\n    zynqmp-sck-kv-g-revA.dtso \\\\\\n    zynqmp-sck-kv-g-revB.dtso \\\\\\n    \"\\nDTB_FILE_NAME:task-install:pn-device-tree = \"\${UBOOT_DTFILE_PREFIX}-zynqmp-sck-kv-g-revB.dtb\"\\nDTB_FILE_NAME:task-deploy:pn-device-tree = \"\${UBOOT_DTFILE_PREFIX}-zynqmp-sck-kv-g-revB.dtb\"\\nPR:append:pn-device-tree = \".1\"\\n
#M# k26-smk-sdt      include/k26-smk.inc       full       none    
#M# k26-sm-sdt       include/k26-sm.inc        full       none    

this=$(realpath $0)

if [ $# -lt 2 ]; then
  echo "$0: <conf_path> <machine_url_index> [machine]" >&2
  exit 1
fi

gmc=`which gen-machineconf`
if [ -z "${gmc}" ]; then
  echo "ERROR: This script must be run in a configured Yocto Project build with gen-machineconf in the environment." >&2
  exit 1
fi

conf_path=$(realpath $1)
if [ ! -d ${conf_path} ]; then
  mkdir -p ${conf_path}
fi


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
while read marker machine include overlay pre post ; do
  if [ "${marker}" != "#M#" ]; then
      continue
  fi

  MACHINES[$count]=${machine}
  INCLUDES[$count]=${include}
  OVERLAYS[$count]=${overlay}
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
  if [ "$pre" = "none" ]; then
    pre=
  fi
  PRE[$count]=${pre}
  POST[$count]=${post}

  count=$(expr $count + 1)
done < ${this}


for mach in ${!MACHINES[@]}; do
  if [ -n "$3" -a "$3" != "${MACHINES[${mach}]}" ]; then
    continue
  fi

  echo "Machine: ${MACHINES[${mach}]}"
  echo "Include: ${INCLUDES[${mach}]}"
  echo "Overlay: ${OVERLAYS[${mach}]}"
  echo "URL:     ${URLS[${mach}]}"
  echo
  if [ ${OVERLAYS[${mach}]} = 'none' ]; then
      set -x
      rm -rf output
      gen-machineconf parse-sdt --hw-description ${URLS[${mach}]} -c ${conf_path} --machine-name ${MACHINES[${mach}]}
      set +x
  else
      set -x
      rm -rf output
      gen-machineconf parse-sdt --hw-description ${URLS[${mach}]} -g ${OVERLAYS[${mach}]} -c ${conf_path} --machine-name ${MACHINES[${mach}]}
      set +x
  fi

  ######### Post gen-machineconf changes
  #
  # Reset the include, gen-machine-conf generally can't include a .inc file, so we do it instead
  sed -i ${conf_path}/machine/${MACHINES[${mach}]}.conf -e 's,^\(require conf/machine/\).*\.conf,\1'${INCLUDES[${mach}]}','

  if [ -n "${PRE[${mach}]}" ]; then
    sed -i ${conf_path}/machine/${MACHINES[${mach}]}.conf -e 's,\(# Required generic machine inclusion\),'"${PRE[${mach}]}"'\n\1,'
  fi

  if [ -n "${POST[${mach}]}" ]; then
    sed -i ${conf_path}/machine/${MACHINES[${mach}]}.conf -e 's,\(^require conf/machine/'${INCLUDES[${mach}]}'\),\1\n\n'"${POST[${mach}]}"','
  fi
done
