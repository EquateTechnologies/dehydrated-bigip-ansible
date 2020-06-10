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

unchanged_cert() {
  echo "entering unchanged_cert() to run Ansible playbook ${ANSIBLE_PLAYBOOK_DEPLOY_CERT_MANAGEMENT}"

  local DOMAIN="${1}" KEYFILE="${2}" CERTFILE="${3}" FULLCHAINFILE="${4}" CHAINFILE="${5}"

  ansible-playbook ${ANSIBLE_ARGS} \
    --inventory=${ANSIBLE_INVENTORY} \
    --extra-vars "cert_file=${FULLCHAINFILE} key_file=${KEYFILE} ${ANSIBLE_EXTRA_VARS}" \
    ${ANSIBLE_PLAYBOOK_DEPLOY_CERT_MANAGEMENT}

  return ${?}
}

HANDLER=${1}; shift;
if [ -n "$(type -t ${HANDLER})" ] && [ "$(type -t ${HANDLER})" = function ]; then
  ${HANDLER} "${@}"
fi

# EOF
