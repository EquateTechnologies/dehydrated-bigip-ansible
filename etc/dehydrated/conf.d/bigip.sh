# /etc/dehydrated/conf.d/bigip.sh
#
# NOTE: The ${VAR:-"Default value"} assignment here provides you a way in which
# to override every variable from the command line.
#
# Simply prepend the variable name, or export it prior to running dehydrated.
#
# e.g. export BIGIP_PARTITION="DEVELOPMENT" && dehydrated ARGS

# The BIG-IP configuration partition to perform all work in
BIGIP_PARTITION=${BIGIP_PARTITION:-"Common"}

# Indicates whether dehydrated hooks will manage client SSL profiles for each cert,
#  0 == client SSL profiles will not be created
#  1 == client SSL profiles will be created/update (same name as cert CN)
BIGIP_CLIENT_SSL_MANAGE=${BIGIP_CLIENT_SSL_MANAGE:-1}

# The parent client SSL profile to inherit default values from, set to a custom
# client SSL profile if desired.
BIGIP_CLIENT_SSL_PARENT=${BIGIP_CLIENT_SSL_PARENT:-"/Common/clientssl"}

# The data group name that will be used for HTTP-01 challenge response lookups
BIGIP_DATA_GROUP_NAME=${BIGIP_DATA_GROUP_NAME:-"ACME_http-01"}

# The issuer certificate that will be specified for monitoring of cert status
# NOTE: This *MUST* be correct. Override if using a staging configuration,
# e.g. BIGIP_ISSUER_CERT=${BIGIP_ISSUER_CERT:-"Lets-Encrypt-Staging-X1"}
BIGIP_ISSUER_CERT=${BIGIP_ISSUER_CERT:-"Lets-Encrypt-X3"}

# Enable OCSP stapling on both certificate and in client SSL profiles (if managed)
BIGIP_OCSP_STAPLE=${BIGIP_OCSP_STAPLE:-1}

# Save the BIG-IP configuration if completing playbooks successfully
BIGIP_SAVE_CONFIG=${BIGIP_SAVE_CONFIG:-1}

# Sync the BIG-IP configuration if completing playbooks successfully
BIGIP_SYNC_CONFIG=${BIGIP_SYNC_CONFIG:-0}

# The BIG-IP device group name to sync to if sync'ing config
BIGIP_SYNC_DEVICE_GROUP=${BIGIP_SYNC_DEVICE_GROUP:-"SYNC-FAILOVER-1"}

# EOF
