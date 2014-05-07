class nagios::sudo {

  file { '/etc/sudoers.d/sudo_nagios':
  ensure => present,
  source => 'puppet://puppet/nagios/sudo_nagios',
  group  => 'root',
  owner  => 'root',
  mode   => '0440',
  }
}	