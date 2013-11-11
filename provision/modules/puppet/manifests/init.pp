# == Class: puppet
#
# This class installs and manages the Puppet client daemon.
#
# === Parameters
#
# [*ensure*]
#   What state the package should be in. Defaults to +latest+. Valid values are
#   +present+ (also called +installed+), +absent+, +purged+, +held+, +latest+,
#   or a specific version number.
#
# === Actions
#
# - Install Puppet client package
# - Ensure puppet-agent daemon is running
#
# === Requires
#
# === Sample Usage
#
#   class { 'puppet': }
#
#   class { 'puppet':
#     ensure => '2.6.8-0.5.el5',
#   }
#
class puppet(
  $ensure = $puppet::params::client_ensure
) inherits puppet::params {

  if $osfamily == 'debian' and $ensure != 'latest' {
    class { 'puppet::apt_pin':
      version => $ensure
    }
  }

  package { 'puppet':
    ensure => $ensure,
  }

  # required to start client agent on ubuntu
  exec { 'start_puppet':
    command => '/bin/sed -i /etc/default/puppet -e "s/START=no/START=yes/"',
    onlyif  => '/usr/bin/test -f /etc/default/puppet',
    require => Package[ 'puppet' ],
    before  => Service[ 'puppet' ],
  }

  service { 'puppet':
    enable  => true,
    ensure  => running,
    require => Package[ 'puppet' ],
  }
  
  file { '/usr/local/bin/papply':
    source => 'puppet:///modules/puppet/papply.sh',
    mode => '0755',
  }

  file { '/usr/local/bin/pull-updates':
    source => 'puppet:///modules/puppet/pull-updates.sh',
    mode => '0755',
  }
  
  file { '/home/vagrant/.ssh/id_rsa':
    source => 'puppet:///modules/puppet/vagrant.priv',
    owner => 'vagrant',
    mode => '0600',
  }

  cron { 'run-puppet':
    ensure => 'present',
    user => 'vagrant',
    command => '/usr/local/bin/pull-updates',
    minute => '*/30',
    hour => '*',
  }

}
