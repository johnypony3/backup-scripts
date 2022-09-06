#!/bin/sh

cd /home/edward/backup-scripts

export BORG_PASSPHRASE=$(</home/edward/.config/secrets/mediaserver-borg-key)

borgmatic -c mediaserver/borgmatic.yaml
