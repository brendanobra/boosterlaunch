#!/bin/bash - 
#===============================================================================
#
#          FILE: instanceup.sh
# 
#         USAGE: ./instanceup.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 09/20/2013 12:40:16 PM PDT
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
STARTUP=`pwd`/gce-up.sh
gcutil addinstance --nopersistent_boot_disk --project=united-helix-317 --metadata_from_file=startup-script:"${STARTUP}" --image=debian-7 --machine_type=n1-standard-1  --zone=us-central2-a boosterlaunch

