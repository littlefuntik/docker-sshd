#!/usr/bin/env sh

set -x

# generate host keys if not present
ssh-keygen -A

# do not detach (-D), log to stderr (-e), passthrough other arguments
exec "$@"
