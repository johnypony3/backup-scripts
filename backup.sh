#!/bin/sh

set -o allexport

export BORG_CONFIG=$1 
. $HOME/.cron-env
cd $CWD
borgmatic create -c $BORG_CONFIG.yaml

set +o allexport