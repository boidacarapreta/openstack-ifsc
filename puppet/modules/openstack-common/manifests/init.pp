class openstack-common {

	package { 'python-setuptools':
		ensure => installed,
	}

	package { 'python-pip':
		ensure => installed,
	}

	package { 'python-keystoneclient':
		ensure => installed,
	}

	package { 'python-glanceclient':
		ensure => installed,
	}

	package { 'python-novaclient':
		ensure => installed,
	}

	package { 'qemu-utils':
		ensure => installed,
	}

	package { 'python-neutronclient':
		ensure => installed,
	}

	package { 'python-cinderclient':
		ensure => installed,
	}

	package { 'python-swiftclient':
		ensure => installed,
	}

	package { 'python-heatclient':
		ensure => installed,
	}

	package { 'python-ceilometerclient':
		ensure => installed,
	}

	package { 'python-troveclient':
		ensure => installed,
	}

	exec { 'ethtool:em1-common':
		command => '/sbin/ethtool -K em1 rx on tx on txvlan on rxvlan on',
	}

	exec { 'ethtool:p5p1-common':
		command => '/sbin/ethtool -K p5p1 rx on tx on txvlan on rxvlan on',
	}

}
