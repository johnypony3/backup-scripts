#!/bin/sh

set -o allexport
PATH=/Users/edward/git/scripts:/opt/local/bin:/opt/local/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export BORG_CONFIG=emmmbp2
. $HOME/.cron-env
export BORG_PASSCOMMAND="security find-generic-password -w -s borg -a borg"

cd $CWD
borgmatic create -c $BORG_CONFIG.yaml --progress --stats --list

set +o allexport
