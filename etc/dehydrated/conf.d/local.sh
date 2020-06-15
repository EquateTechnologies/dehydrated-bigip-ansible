# /etc/dehydrated/conf.d/local.sh

# Unset or set these here if appropriate for your environment,
# unset proxy
# unset http_proxy
# unset https_proxy
# unset ftp_proxy
# unset no_proxy

ANSIBLE_ARGS=${ANSIBLE_ARGS:-""}
ANSIBLE_EXTRA_VARS=${ANSIBLE_EXTRA_VARS:-""}
ANSIBLE_INVENTORY=${ANSIBLE_INVENTORY:-"/etc/dehydrated/ansible/bigip-inventory.ini"}
ANSIBLE_PLAYBOOK_CLEAN_CHALLENGE=${ANSIBLE_PLAYBOOK_CLEAN_CHALLENGE:-"/etc/dehydrated/ansible/playbooks/bigip-clean_challenge.yml"}
ANSIBLE_PLAYBOOK_DEPLOY_CERT_TRAFFIC=${ANSIBLE_PLAYBOOK_DEPLOY_CERT:-"/etc/dehydrated/ansible/playbooks/bigip-deploy_cert-traffic.yml"}
ANSIBLE_PLAYBOOK_DEPLOY_CERT_MANAGEMENT=${ANSIBLE_PLAYBOOK_DEPLOY_CERT:-"/etc/dehydrated/ansible/playbooks/bigip-deploy_cert-management.yml"}
ANSIBLE_PLAYBOOK_DEPLOY_CHALLENGE=${ANSIBLE_PLAYBOOK_DEPLOY_CHALLENGE:-"/etc/dehydrated/ansible/playbooks/bigip-deploy_challenge.yml"}

BIGIP_CLIENT_SSL_MANAGE=${BIGIP_CLIENT_SSL_MANAGE:-1}
BIGIP_CLIENT_SSL_PARENT=${BIGIP_CLIENT_SSL_PARENT:-"/Common/clientssl"}
BIGIP_DATA_GROUP_NAME=${BIGIP_DATA_GROUP_NAME:-"ACME_http-01"}
BIGIP_PARTITION=${BIGIP_PARTITION:-"Common"}
BIGIP_SAVE_CONFIG=${BIGIP_SAVE_CONFIG:-1}
BIGIP_SYNC_CONFIG=${BIGIP_SYNC_CONFIG:-0}
BIGIP_SYNC_DEVICE_GROUP=${BIGIP_SYNC_DEVICE_GROUP:-"SYNC-FAILOVER-1"}
BIGIP_ISSUER_CERT=${BIGIP_ISSUER_CERT:-"Lets-Encrypt-X3"}
BIGIP_OCSP_STAPLE=${BIGIP_OCSP_STAPLE:-1}

LEXICON_ARGS=${LEXICON_ARGS:-"--config-dir /etc/lexicon"}
LEXICON_PROVIDER=${LEXICON_PROVIDER:-"cloudflare"}
LEXICON_PROVIDER_ARGS=${LEXICON_PROVIDER_ARGS:-"--output=QUIET"}

# EOF
