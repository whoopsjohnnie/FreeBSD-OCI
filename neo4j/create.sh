#!/usr/bin/env bash
set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
THIS_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
echo "This Dir: $THIS_DIR"
source $THIS_DIR/common.sh

# Create jail
iocage create -r ${JAIL_RELEASE} -n ${JAIL_NAME}
# iocage create -r ${JAIL_RELEASE} -n ${JAIL_NAME} -p ./packages.json

# Configure jail
iocage set vnet=on ${JAIL_NAME}
iocage set ip4_addr="${JAIL_VNET}|${JAIL_IP}/24" ${JAIL_NAME}
iocage set interfaces="${JAIL_VNET}:${JAIL_IFACE}" ${JAIL_NAME}

iocage set mount_fdescfs="1" ${JAIL_NAME}
iocage set mount_procfs="1" ${JAIL_NAME}

# Start jail
iocage start ${JAIL_NAME}

# Install jail
ASSUME_ALWAYS_YES=yes iocage pkg ${JAIL_NAME} install -y openjdk11
ASSUME_ALWAYS_YES=yes iocage pkg ${JAIL_NAME} install -y openjdk17
ASSUME_ALWAYS_YES=yes iocage pkg ${JAIL_NAME} install -y neo4j

iocage exec ${JAIL_NAME} sysrc "neo4j_env=\"JAVA_HOME=/usr/local/openjdk11/\""
iocage exec ${JAIL_NAME} sysrc "neo4j_enable=YES"

iocage exec ${JAIL_NAME} service neo4j start

