#!/bin/sh

info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

cd /mediaserver

info "Mounting backup location"
mount /mnt/nas_dev_backup 2> /dev/null

info "Getting rid of garbage"
find . -name '*DS_Store' -type f -delete

info "Stopping containers"
docker-compose stop

export BORG_REPO=/mnt/nas_dev_backup/mediaserver
export BORG_PASSPHRASE=$(<~/.config/secrets/mediaserver-borg-key)

info "Starting backup"
borg create                                 \
    --list                                  \
    --stats                                 \
    --show-rc                               \
    --exclude-caches                        \
    ::"{hostname}-$(date +"%F-%H-%M-%S")"   \
    /mediaserver

backup_exit=$?

info "Pruning repository"
borg prune                          \
    --list                          \
    --prefix '{hostname}-'          \
    --show-rc                       \
    --keep-hourly   48              \
    --keep-daily    7               \
    --keep-weekly   4               \
    --keep-monthly  6

prune_exit=$?

info "Compacting repository"
borg compact

compact_exit=$?

global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))
global_exit=$(( compact_exit > global_exit ? compact_exit : global_exit ))

if [ ${global_exit} -eq 0 ]; then
    info "Backup, Prune, and Compact finished successfully"
elif [ ${global_exit} -eq 1 ]; then
    info "Backup, Prune, and/or Compact finished with warnings"
else
    info "Backup, Prune, and/or Compact finished with errors"
fi

info "Starting containers"
docker-compose start

exit ${global_exit}