#!/bin/sh

cd  /Users/edward/git/backup-scripts

export BORG_PASSPHRASE=$(</users/edward/.config/secrets/emmmb2-borg-key)

borgmatic -c emmmbp2/borgmatic.yaml