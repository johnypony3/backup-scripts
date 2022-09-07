#!/bin/sh

set -o allexport
PATH=/Users/edward/git/scripts:/opt/local/bin:/opt/local/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

export CWD=$HOME/backup-scripts
export BORG_CONFIG=emmmbp2

cd $CWD

common/install.sh

export BORG_PASSCOMMAND="security find-generic-password -w -s borg -a borg"

borgmatic create -c $BORG_CONFIG.yaml --progress --stats --list

set +o allexport
