# /etc/dehydrated/lib.d/nsupdate.sh

function deploy_challenge {
  # This hook is called once for every domain that needs to be
  # validated, including any alternative names you may have listed.
  #
  # Parameters:
  # - DOMAIN
  #   The domain name (CN or subject alternative name) being
  #   validated.
  # - TOKEN_FILENAME
  #   The name of the file containing the token to be served for HTTP
  #   validation. Should be served by your web server as
  #   /.well-known/acme-challenge/${TOKEN_FILENAME}.
  # - TOKEN_VALUE
  #   The token value that needs to be served for validation. For DNS
  #   validation, this is what you want to put in the _acme-challenge
  #   TXT record. For HTTP validation it is the value that is expected
  #   be found in the $TOKEN_FILENAME file.
  local DOMAIN="${1}" TOKEN_FILENAME="${2}" TOKEN_VALUE="${3}"

  echo "deploy_challenge called: ${DOMAIN}, ${TOKEN_FILENAME}, ${TOKEN_VALUE}"

  for NSUPDATE_SERVER in ${NSUPDATE_SERVER_LIST} ; do
    echo "deploy_challenge to server ${NSUPDATE_SERVER}"

    printf "server %s\nupdate add _acme-challenge.%s. %d in TXT \"%s\"\nsend\n" "${NSUPDATE_SERVER}" "${DOMAIN}" "${NSUPDATE_RECORD_DEFAULT_TTL}" "${TOKEN_VALUE}" | ${NSUPDATE} ${NSUPDATE_ARGS} || exit 1

    RETVAL=$?

    sleep 30
  done

  return ${RETVAL}
}

function clean_challenge {
  # This hook is called after attempting to validate each domain,
  # whether or not validation was successful. Here you can delete
  # files or DNS records that are no longer needed.
  #
  # The parameters are the same as for deploy_challenge.
  local DOMAIN="${1}" TOKEN_FILENAME="${2}" TOKEN_VALUE="${3}"

  echo "clean_challenge called: ${DOMAIN}, ${TOKEN_FILENAME}, ${TOKEN_VALUE}"

  for NSUPDATE_SERVER in ${NSUPDATE_SERVER_LIST} ; do
    echo "clean_challenge to server ${NSUPDATE_SERVER}"

    printf "server %s\nupdate delete _acme-challenge.%s. %d in TXT \"%s\"\nsend\n" "${NSUPDATE_SERVER}" "${DOMAIN}" "${NSUPDATE_RECORD_DEFAULT_TTL}" "${TOKEN_VALUE}" | ${NSUPDATE} ${NSUPDATE_ARGS}
  done

  return ${?}
}

# EOF
