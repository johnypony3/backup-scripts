#!/bin/sh

set -o allexport

export CWD=$HOME/backup-scripts
export BORG_CONFIG=mediaserver
export BORG_PASSCOMMAND="cat $HOME/.config/secrets/borg"

cd $CWD

common/install.sh; . common/.cron-env;


echo "BORG_CONFIG_FILE:$BORG_CONFIG_FILE"

borgmatic create -c $BORG_CONFIG_FILE --progress --stats --list --monitoring-verbosity 2 --log-file $HOME/log/backup.log

set +o allexport