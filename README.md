## Dehydrated F5 BIG-IP using Ansible

"dehydrated-bigip-ansible" is a set of hooks for "dehydrated", which is a Let's Encrypt client written entirely in Bash shell.

Included are a number of Ansible playbooks, used by the hooks, that perform ACME HTTP-01 or DNS-01 challenge completion; and if successful will deploy key/s and certs to targeted F5 BIG-IP systems.

"dehydrated-bigip-ansible" leverages default Ansible modules all interaction with BIG-IP systems; mostly we use the official F5 BIG-IP Ansible modules ( https://clouddocs.f5.com/products/orchestration/ansible/ ) however some Ansible based SSH file transfer and command execution is used if deploy an F5 BIG-IP management certificate.

This provides automation for ACME based challenge validation via and certificate/key deployment to F5 BIG-IP appliances.

HTTP-01 and DNS-01 based validation processes can both be used; but are supported using different hook scripts.

Recently tested with BIG-IP versions:

- VE, 13.x (TBC)
- VE, 14.1.2.5.0.0.3
- VE, 15.1.0.3.0.0.12
