#!/bin/bash

mkdir -p /root/.config/rclone
echo "$RCLONE_CONFIG" > /root/.config/rclone/rclone.conf

mkdir -p /media/movies /media/tvshows

rclone sync gdrive:Moives /media/movies --transfers=4 --log-level INFO
rclone sync gdrive:Series /media/tvshows --transfers=4 --log-level INFO

while true; do
  sleep 1h
  rclone sync gdrive:Moives /media/movies --transfers=4 --log-level INFO
  rclone sync gdrive:Series /media/tvshows --transfers=4 --log-level INFO
done &

/jellyfin/jellyfin
