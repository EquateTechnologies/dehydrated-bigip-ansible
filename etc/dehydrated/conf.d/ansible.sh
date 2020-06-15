# /etc/dehydrated/conf.d/ansible.sh

# NOTE: The ${VAR:-"Default value"} assignment here provides you a way in which
# to override every variable from the command line.
#
# Simply prepend the variable name, or export it prior to running dehydrated.
#
# e.g. export ANSIBLE_ARGS="--vault-password-file /etc/ansible/vault.default.pass" && dehydrated ARGS

# Default Ansible arguments to be included as part of ansible-playbook commands
ANSIBLE_ARGS=${ANSIBLE_ARGS:-"--vault-password-file ~/.ansible/vault.pass"}

# Default extra variables to included as part of ansible-playbook commands
ANSIBLE_EXTRA_VARS=${ANSIBLE_EXTRA_VARS:-""}

# Default inventory file to point ansible-playbook to
ANSIBLE_INVENTORY=${ANSIBLE_INVENTORY:-"/etc/dehydrated/ansible/bigip-inventory.ini"}

# Playbook used to deploy (create) challenge tokens by dehydrated
ANSIBLE_PLAYBOOK_DEPLOY_CHALLENGE=${ANSIBLE_PLAYBOOK_DEPLOY_CHALLENGE:-"/etc/dehydrated/ansible/playbooks/bigip-deploy_challenge.yml"}

# Playbook used to clean (remove) challenge tokens by dehydrated
ANSIBLE_PLAYBOOK_CLEAN_CHALLENGE=${ANSIBLE_PLAYBOOK_CLEAN_CHALLENGE:-"/etc/dehydrated/ansible/playbooks/bigip-clean_challenge.yml"}

# Playbook used to deploy BIG-IP management certificates
ANSIBLE_PLAYBOOK_DEPLOY_CERT_MANAGEMENT=${ANSIBLE_PLAYBOOK_DEPLOY_CERT_MANAGEMENT:-"/etc/dehydrated/ansible/playbooks/bigip-deploy_cert-management.yml"}

# Playbook used to deploy BIG-IP traffic certificates
ANSIBLE_PLAYBOOK_DEPLOY_CERT_TRAFFIC=${ANSIBLE_PLAYBOOK_DEPLOY_CERT_TRAFFIC:-"/etc/dehydrated/ansible/playbooks/bigip-deploy_cert-traffic.yml"}

# EOF
