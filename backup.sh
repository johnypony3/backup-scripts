#!/bin/sh

set -o allexport

export BORG_CONFIG=$1 

. $HOME/.cron-env

cd $CWD

borgmatic create -c $BORG_CONFIG.yaml --progress --stats --list -n

set +o allexport