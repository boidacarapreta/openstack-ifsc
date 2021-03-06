class dns {

	package { 'bind9':
		ensure => latest,
	}

	file { 'named.conf':
		path => '/etc/bind/named.conf',
		source => 'puppet:///modules/dns/named.conf',
		owner => root,
		group => bind,
		mode => 0640,
		require => Package['bind9'],
	}

	file { 'openstack.sj.ifsc.edu.br-internal':
		path => '/etc/bind/openstack.sj.ifsc.edu.br-internal',
		ensure => file,
		source => 'puppet:///modules/dns/openstack.sj.ifsc.edu.br-internal',
		owner => root,
		group => bind,
		mode => 0640,
		require => Package['bind9'],
	}

	file { 'openstack.sj.ifsc.edu.br-external':
		path => '/etc/bind/openstack.sj.ifsc.edu.br-external',
		ensure => file,
		source => 'puppet:///modules/dns/openstack.sj.ifsc.edu.br-external',
		owner => root,
		group => bind,
		mode => 0640,
		require => Package['bind9'],
	}

	service { 'bind9':
		name => 'bind9',
		ensure => running,
		enable => true,
		subscribe => [
			File['named.conf'],
			File['openstack.sj.ifsc.edu.br-internal'],
			File['openstack.sj.ifsc.edu.br-external'],
		],
	}

}
