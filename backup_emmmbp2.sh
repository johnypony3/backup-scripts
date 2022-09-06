#!/bin/sh

cd  /Users/edward/git/backup-scripts

export BORG_PASSPHRASE=$(</users/edward/.config/secrets/emmmb2-borg-key)

alias borg=/opt/homebrew/bin/borg
borgmatic -c emmmbp2/borgmatic.yaml