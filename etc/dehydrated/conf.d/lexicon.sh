# /etc/dehydrated/conf.d/lexicon.sh

# NOTE: The ${VAR:-"Default value"} assignment here provides you a way in which
# to override every variable from the command line.
#
# Simply prepend the variable name, or export it prior to running dehydrated.
#
# e.g. export LEXICON_ARGS="--config-dir /custom/dir" && dehydrated ARGS

# Additional common arguments added to the lexicon command *BEFORE* the provider
# is specified and provider arguments are added.
LEXICON_ARGS=${LEXICON_ARGS:-"--config-dir /etc/lexicon"}

# The lexicon provider to utilise
LEXICON_PROVIDER=${LEXICON_PROVIDER:-"cloudflare"}

# Extra lexicon provider specific arguments to utilise
LEXICON_PROVIDER_ARGS=${LEXICON_PROVIDER_ARGS:-""}

# EOF
