schedule { 'daily':
	period => daily,
	repeat => 1,
}

package { 'puppet':
	ensure => latest,
}

service { 'puppet':
	ensure => running,
	enable => true,
}

include users
include environment
include cron
include ntp
include smtp
include ssh
include snmp::agent

node "roteador" {

	include syslog::client
	include router
	include nginx

}

node "openstack0" {

	package { 'puppetmaster':
		ensure => latest,
	}

	service { 'puppetmaster':
		ensure => running,
		enable => true,
	}

	include nvidia
	include syslog::server
	include keepalived
	include haproxy
	include mysql
	include ceph-common
	include ceph-openstack0
	include ceph-osd-init
	include ceph-mds
	include ceph-radosgw
	include openstack-common
	include openstack-rabbitmq
	include openstack-keystone
	include openstack-keystone::cleaning
	include openstack-glance
	include openstack-nova::controller
	include openstack-nova::compute::kvm
	include openstack-neutron::controller
	include openstack-neutron::agent::compute
	include openstack-neutron::agent::network
	include openstack-cinder::controller
	include openstack-cinder::node
	include openstack-heat
	include openstack-ceilometer::compute
	include snmp::manager::backend

}

node "openstack1" {

	include nvidia
	include dns
	include syslog::client
	include keepalived
	include haproxy
	include ceph-common
	include ceph-openstack1
	include openstack-common
	include openstack-keystone
	include openstack-nova::compute::kvm
	include openstack-neutron::agent::compute
	include openstack-neutron::agent::network
	include openstack-cinder::node
	include openstack-trove
	include openstack-ceilometer::compute

}

node "openstack2" {

	include nvidia
	include dns
	include syslog::client
	include keepalived
	include haproxy
	include ceph-common
	include ceph-openstack2
	include openstack-common
	include openstack-nova::compute::kvm
	include openstack-neutron::agent::compute
	include openstack-neutron::agent::network
	include openstack-cinder::node
	include openstack-ceilometer::controller
	include openstack-ceilometer::compute

}

node "openstack3" {

	include nvidia
	include syslog::client
	include keepalived
	include haproxy
	include ceph-common
	include ceph-openstack3
	include openstack-common
	include openstack-nova::compute::kvm
	include openstack-neutron::agent::compute
	include openstack-neutron::agent::network
	include openstack-cinder::node
	include openstack-ceilometer::compute
	include openstack-horizon::package
	include snmp::manager::frontend

}
