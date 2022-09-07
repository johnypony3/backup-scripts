#!/bin/sh

set -o allexport

export BORG_CONFIG=mediaserver

. $HOME/.cron-env

cd $CWD

borgmatic create -c $BORG_CONFIG.yaml --progress --stats --list --monitoring-verbosity 2 --log-file $HOME/log/backup.log

set +o allexport