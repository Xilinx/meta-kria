#!/bin/sh

error() { echo "ERROR: ${1}" 1>&2; exit 1; }

SOM_EEPROM="/sys/bus/i2c/devices/1-0050/eeprom"
CARRIER_EEPROM="/sys/bus/i2c/devices/1-0051/eeprom"

PACKAGE_FEED_URIS="@@PACKAGE_FEED_URIS@@"

ARCHCONFIG_FILE="/etc/archconfig"

SOM=$(ipmi-fru --fru-file="${SOM_EEPROM}" --interpret-oem-data | \
    awk -F": " '/Product Name/ {split($2,arr,"-"); print tolower(arr[2]"_"arr[1])}')

CARRIER=$(ipmi-fru --fru-file="${CARRIER_EEPROM}" --interpret-oem-data | \
    awk -F": " '/Product Name/ {split($2,arr,"-"); print tolower(arr[2])}')

if [ -z "${SOM}" ] || [ -z "${CARRIER}" ]; then
    error "Unable to read SOM or Carrier Card version from EEPROM"
fi

if [ -f "${ARCHCONFIG_FILE}" ]; then # Check config

    if ! grep "${SOM}_${CARRIER}" /etc/dnf/vars/arch > /dev/null; then
        error "Carrier card configuration missing from DNF config"
    fi

    if ! grep "${SOM}_${CARRIER}" /etc/rpmrc > /dev/null; then
        error "Carrier card configuration missing from RPM config"
    fi

    if ! grep "${SOM}_${CARRIER}" /etc/oe-remote-repo-*.repo > /dev/null; then
        error "Carrier card configuration missing from remote repo config"
    fi

else # First boot - configure package manager

    sed -i "s/:/:${SOM}_${CARRIER}:/" /etc/dnf/vars/arch

    sed -i "s/^arch_compat.*/& ${SOM}_${CARRIER}/" /etc/rpmrc

    for URI in ${PACKAGE_FEED_URIS}; do
        FILE_NAME=$(echo "$URI" | cut -d'/' -f4- | sed -e 's,/,-,g' -e 's,-$,,')
        REPO_NAME=$(echo "${FILE_NAME}" | tr "-" " ")
        {
            echo "[oe-remote-repo-${FILE_NAME}-${SOM}_${CARRIER}]"
            echo "name=OE Remote Repo: ${REPO_NAME} ${SOM}_${CARRIER}"
            echo "baseurl=${URI}/${SOM}_${CARRIER}"
            echo "gpgcheck=0"
        } >> "/etc/yum.repos.d/oe-remote-repo-${FILE_NAME}.repo"
    done

    date > ${ARCHCONFIG_FILE}

fi
