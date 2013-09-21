#!/bin/sh
./up.sh
sleep 60s
./push.sh /home/brendan/projects/boosterlaunch/dist/boosterlaunch-1.0-SNAPSHOT.zip
./do-provision.sh
