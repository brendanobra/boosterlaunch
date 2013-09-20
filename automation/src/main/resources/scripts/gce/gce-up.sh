#!/bin/bash - 
#===============================================================================
#
#          FILE: gce-up.sh
# 
#         USAGE: ./gce-up.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 09/20/2013 12:45:54 PM PDT
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
wget -O /tmp/puppetlabs.repo http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
dpkg -i /tmp/puppetlabs.repo
apt-get update
apt-get install --assume-yes git
cd /tmp; git clone https://github.com/brendanobra/boosterlaunch.git 
cp /tmp/boosterlaunch/automation/src/main/resources/etc/puppet/hiera.yaml /etc/puppet
apt-get install --assume-yes puppet
gem install hiera-file
mkdir -p /etc/puppet/hieradata
cp -R /tmp/boosterlaunch/hieradata/* /etc/puppet/hieradata
mkdir -p /etc/facter/facts.d
echo "role=appserver" >> /etc/facter/facts.d/role.txt
echo "hiera_include(classes)" > /tmp/puppet.pp
cp -R /tmp/boosterlaunch/automation/src/main/resources/puppet/modules/boosterlaunch /etc/puppet/modules

puppet apply --debug /tmp/puppet.pp

