#!/bin/bash -l
#
# Deploy HTTPS certs and keys to F5 BIG-IP using Ansible
#

set -e
set -u
set -o pipefail

for FILE in ${BASEDIR}/conf.d/*.sh ; do
  . ${FILE}
done

# NOTE: Include necessary DNS-01 hook functions here, you probably need to
# uncomment one of the below or create your own library with deploy_challenge
# and clean_challenge functions.
#
. ${BASEDIR}/lib.d/lexicon.sh
# . ${BASEDIR}/lib.d/nsupdate.sh

deploy_cert() {
  echo "entering deploy_cert() to run Ansible playbook ${ANSIBLE_PLAYBOOK_DEPLOY_CERT_TRAFFIC}"

  local DOMAIN="${1}" KEYFILE="${2}" CERTFILE="${3}" FULLCHAINFILE="${4}" CHAINFILE="${5}"

  # remove leading "*." from wildcard certs and replace with "wildcard."
  local CERT_NAME="`echo ${DOMAIN} | sed 's/^\*\./wildcard./' -`"
  local CLIENT_SSL_NAME=${CERT_NAME}

  ansible-playbook ${ANSIBLE_ARGS} \
    --inventory="${ANSIBLE_INVENTORY}" \
    --extra-vars "bigip_partition=${BIGIP_PARTITION} cert_issuer=${BIGIP_ISSUER_CERT} cert_name=${CERT_NAME} cert_key_file=${KEYFILE} cert_file=${CERTFILE} cert_chain_file=${CHAINFILE} cert_fullchain_file=${FULLCHAINFILE} clientssl_manage=${BIGIP_CLIENT_SSL_MANAGE} clientssl_name=${CLIENT_SSL_NAME} clientssl_parent=${BIGIP_CLIENT_SSL_PARENT} ocsp_staple=${BIGIP_OCSP_STAPLE} save_config=${BIGIP_SAVE_CONFIG} sync_config=${BIGIP_SYNC_CONFIG} sync_device_group=${BIGIP_SYNC_DEVICE_GROUP} ${ANSIBLE_EXTRA_VARS}" \
    ${ANSIBLE_PLAYBOOK_DEPLOY_CERT_TRAFFIC}

  return ${?}
}

HANDLER=${1}; shift;
if [ -n "$(type -t ${HANDLER})" ] && [ "$(type -t ${HANDLER})" = function ]; then
  ${HANDLER} "${@}"
fi

# EOF
