sudo wget -O /tmp/puppetlabs.repo http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
sudo dpkg -i /tmp/puppetlabs.repo
sudo apt-get update
sudo apt-get install --assume-yes git unzip 
cd /tmp; git clone https://github.com/brendanobra/boosterlaunch.git 
sudo apt-get install --assume-yes puppet
sudo gem install hiera-file
sudo cp /tmp/boosterlaunch/automation/src/main/resources/etc/puppet/hiera.yaml /etc/puppet
sudo mkdir -p /etc/puppet/hieradata
sudo cp -R /tmp/boosterlaunch/hieradata/* /etc/puppet/hieradata
sudo mkdir -p /etc/facter/facts.d
sudo echo "role=appserver" >> /tmp/role.txt
sudo cp /tmp/role.txt /etc/facter/facts.d
sudo echo "hiera_include(classes)" > /tmp/puppet.pp
sudo cp -R /tmp/boosterlaunch/automation/src/main/resources/puppet/modules/boosterlaunch /etc/puppet/modules
sudo puppet apply --debug /tmp/puppet.pp
cd /tmp; unzip boosterlaunch-1.0-SNAPSHOT.zip 
cd /tmp/boosterlaunch-1.0-SNAPSHOT;chmod +rx start; nohup ./start &
