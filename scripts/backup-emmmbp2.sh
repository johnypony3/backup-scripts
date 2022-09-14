#!/bin/sh

set -o allexport
PATH=/Users/edward/git/scripts:/opt/local/bin:/opt/local/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

export CWD=$HOME/git/backup-scripts
export BORG_CONFIG=emmmbp2
export BORG_PASSCOMMAND="security find-generic-password -w -s borg -a borg"

cd $CWD

common/install.sh; . common/.cron-env;

echo "BORG_CONFIG_FILE:$BORG_CONFIG_FILE"

borgmatic create -c $BORG_CONFIG_FILE --progress --stats --list

set +o allexport
