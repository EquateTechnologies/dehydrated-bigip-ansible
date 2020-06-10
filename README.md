## Dehydrated F5 BIG-IP using Ansible

"dehydrated-bigip-ansible" is a set of hooks for "dehydrated", which is a Let's Encrypt client written entirely in Bash shell.

Included are a number of Ansible playbooks, used by the hooks, that perform ACME HTTP-01 or DNS-01 challenge completion; and if successful will deploy key/s and certs to targeted F5 BIG-IP systems.

"dehydrated-bigip-ansible" leverages default Ansible modules all interaction with BIG-IP systems; mostly we use the official F5 BIG-IP Ansible modules ( https://clouddocs.f5.com/products/orchestration/ansible/ ) however some Ansible based SSH file transfer and command execution is used if deploy an F5 BIG-IP management certificate.

This provides automation for ACME based challenge validation via and certificate/key deployment to F5 BIG-IP appliances.

HTTP-01 and DNS-01 based validation processes can both be used; but are supported using different hook scripts.

Recently tested with BIG-IP versions:

- VE, 13.1.3.2.0.0.4
- VE, 14.1.2.5.0.0.3
- VE, 15.1.0.3.0.0.12

NOTE: This is effectively the replacement for the old [dehydrated-bigip](https://github.com/colin-stubbs/dehydrated-bigip/) project.

### Documentation

All documentation is available in the Wiki connected to this repository, start here: [Wiki](https://github.com/EquateTechnologies/dehydrated-bigip-ansible/wiki)

### Support

Free support via this repository is available on a best effort basis. Please [log an issue](https://github.com/EquateTechnologies/dehydrated-bigip-ansible/issues) describing the problem, and if you've already worked out what the issue is and fixed it in a fork of the repository then feel free to submit a [pull request](https://github.com/EquateTechnologies/dehydrated-bigip-ansible/pulls).

Equate Technologies can provide full support with SLA's for paying customers. For information please contact us via [our contact page](https://equatetechnologies.com.au/contact-us/)
