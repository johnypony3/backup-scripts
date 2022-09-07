#!/bin/sh

set -o allexport

export CWD=$HOME/backup-scripts
export BORG_CONFIG=mediaserver

cd $CWD

common/install.sh

borgmatic create -c ../configs/$BORG_CONFIG.yaml --progress --stats --list --monitoring-verbosity 2 --log-file $HOME/log/backup.log

set +o allexport