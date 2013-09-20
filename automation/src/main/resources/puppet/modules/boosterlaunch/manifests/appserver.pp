class boosterlaunch::appserver{
	package{'openjdk-7-jdk':
		ensure => present,
	}
	package{'jetty':
		require => [Package['openjdk-7-jdk']],
		ensure => 'present',
	}
	file{'/etc/default/jetty':
		require => [Package['jetty']],
		ensure => file,
		content => hiera('jetty'),
	}
	service{'jetty':
		require => [File['/etc/default/jetty']],
		ensure => 'running',
		enable => 'true'
	}
}
