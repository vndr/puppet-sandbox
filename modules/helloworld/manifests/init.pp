# == Class: helloworld
#
# This class is a bare bones example to ensure puppet master/clients are
# talking to each other.
#
# === Parameters
#
# === Actions
#
# === Requires
#
# === Sample Usage
#
# class { 'helloworld': }
#
class helloworld {

  file { '/tmp/hello':
    owner   => 'root',
    group   => 'root',
    mode    => '0666',
    content => "world\n",
  }

  file { '/tmp/hellogeoff':
    owner   => 'root',
    group   => 'root',
    mode    => '0666',
    content => "Hello geoff Hello Juraj\n",
  }

  file { '/tmp/hellojuraj':
    owner   => 'root',
    group   => 'root',
    mode    => '0666',
    content => "Hello Juraj\n",
  }

}
