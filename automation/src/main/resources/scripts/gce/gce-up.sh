wget -O /tmp/puppetlabs.repo http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb\n
dpkg -i /tmp/puppetlabs.repo\n
apt-get update\n
apt-get install --assume-yes git\n
cd /tmp; git clone https://github.com/brendanobra/boosterlaunch.git\n 
apt-get install --assume-yes puppet\n
gem install hiera-file\n
cp /tmp/boosterlaunch/automation/src/main/resources/etc/puppet/hiera.yaml /etc/puppet\n
mkdir -p /etc/puppet/hieradata\n
cp -R /tmp/boosterlaunch/hieradata/* /etc/puppet/hieradata\n
mkdir -p /etc/facter/facts.d\n
echo "role=appserver" >> /etc/facter/facts.d/role.txt\n
echo "hiera_include(classes)" > /tmp/puppet.pp\n
cp -R /tmp/boosterlaunch/automation/src/main/resources/puppet/modules/boosterlaunch /etc/puppet/modules\n
puppet apply --debug /tmp/puppet.pp\n
