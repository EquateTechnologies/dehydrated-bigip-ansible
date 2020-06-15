## Dehydrated F5 BIG-IP using Ansible

NOTE: This project is the replacement for the old [dehydrated-bigip](https://github.com/colin-stubbs/dehydrated-bigip/) project.

dehydrated-bigip-ansible is a set of hooks for dehydrated, which is an ACME API client written entirely in Bash shell. It's typically used with the ACME API provided by Let's Encrypt.

Included are a number of Ansible playbooks, used by the hooks, that perform ACME HTTP-01 or DNS-01 challenge completion; and if successful will deploy keys and certs to targetted F5 BIG-IP systems.

dehydrated-bigip-ansible leverages default Ansible modules for all interaction with BIG-IP systems; mostly we use the official F5 BIG-IP Ansible modules ( https://clouddocs.f5.com/products/orchestration/ansible/ ) that are included by default, however direct SSH file transfer and command execution (still using Ansible native modules) is used if deploying an F5 BIG-IP management interface certificate.

This provides automation for obtaining and deploy certificates and keys to F5 BIG-IP appliances from an ACME Certificate Authority.

HTTP-01 and DNS-01 based validation processes can both be used; but are supported using different hook scripts.

Recently tested with BIG-IP versions:

- VE, 13.1.3.2.0.0.4
- VE, 14.1.2.5.0.0.3
- VE, 15.1.0.3.0.0.12

The content in this repository has been used against the following ACME API's,

- Let’s Encrypt (ACMEv2) - [https://letsencrypt.org/](https://letsencrypt.org/)
- DigiCert CertCentral (ACMEv2) - [https://www.digicert.com](https://www.digicert.com)

HTTP-01 validation based on the content (F5 BIG-IP iRule etc) in this repository has been used against the following DNS service API's,

- Let’s Encrypt (ACMEv2) - [https://letsencrypt.org/](https://letsencrypt.org/)
- DigiCert CertCentral (ACMEv2) - [https://www.digicert.com](https://www.digicert.com)

DNS-01 validation based on the content in this repository has been used against the following DNS service API's,

- Azure DNS - [https://azure.microsoft.com/en-au/services/dns](https://azure.microsoft.com/en-au/services/dns)
- CloudFlare - [https://cloudflare.com/](https://cloudflare.com/)

### Documentation

All documentation is available in the Wiki connected to this repository, start here: [Wiki](https://github.com/EquateTechnologies/dehydrated-bigip-ansible/wiki)

The official documentation from the other components involved should be utilised,

- ansible - [https://www.ansible.com/](https://www.ansible.com/)
- dehydrated - [https://dehydrated.io/](https://dehydrated.io/)
- lexicon - [https://github.com/AnalogJ/lexicon](https://github.com/AnalogJ/lexicon)

### Support

Free support via this repository is available on a best effort basis. Please [log an issue](https://github.com/EquateTechnologies/dehydrated-bigip-ansible/issues) describing the problem, and if you've already worked out what the issue is and fixed it in a fork of the repository then feel free to submit a [pull request](https://github.com/EquateTechnologies/dehydrated-bigip-ansible/pulls).

Equate Technologies can provide full support with SLA's for paying customers. For information please contact us via [our contact page](https://equatetechnologies.com.au/contact-us/)
