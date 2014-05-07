class nagios::nagios_nrpe {
	include nagios::sudo
	
    package {'nagios-nrpe':
    ensure => installed,
    alias  => 'nagios-nrpe',
    ;
    }

    package {'nagios-plugins':
    ensure => installed,
    alias  => 'nagios-plugins',
    ;
    }

    file {'/etc/nagios/nrpe.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/nrpe.cfg.erb'),
    }

    file {'/etc/xinetd.d/nrpe':
    ensure => absent
    }

    file { '/usr/lib64/nagios/plugins/check_uptime':
    ensure => present,
    source => 'puppet://puppet/nagios/check_uptime',
    group  => 'nagios',
    owner  => 'nagios',
    mode   => '0554'
    }

    file { '/usr/lib64/nagios/plugins/check_ng_mem_simple':
    ensure => present,
    source => 'puppet://puppet/nagios/check_ng_mem_simple',
    group  => 'nagios',
    owner  => 'nagios',
    mode   => '0554'
    }

    file { '/usr/lib64/nagios/plugins/check_xen':
    ensure => present,
    source => 'puppet://puppet/nagios/check_xen',
    group  => 'nagios',
    owner  => 'nagios',
    mode   => '0554'
    }

    file { '/usr/lib64/nagios/plugins/check_robots_update':
    ensure => present,
    source => 'puppet://puppet/nagios/check_robots_update.rb',
    group  => 'nagios',
    owner  => 'nagios',
    mode   => '0554'
    }
    
	file { '/usr/lib64/nagios/plugins/check_3ware_raid':
    ensure => present,
    source => 'puppet://puppet/nagios/check_3ware_raid',
    group  => 'nagios',
    owner  => 'nagios',
    mode   => '0554'
    }

	file { '/usr/lib64/nagios/plugins/check_aacraid.py':
    ensure => present,
    source => 'puppet://puppet/nagios/check_aacraid.py',
    group  => 'nagios',
    owner  => 'nagios',
    mode   => '0554'
    }
	
	file { '/usr/lib64/nagios/plugins/check_megaraid_sas':
    ensure => present,
    source => 'puppet://puppet/nagios/check_megaraid_sas',
    group  => 'nagios',
    owner  => 'nagios',
    mode   => '0554'
    }
	
	file { '/usr/lib64/nagios/plugins/check_ng_3ware.sh':
    ensure => present,
    source => 'puppet://puppet/nagios/check_ng_3ware.sh',
    group  => 'nagios',
    owner  => 'nagios',
    mode   => '0554'
    }
	
	file { '/usr/lib64/nagios/plugins/check_ipmi_sensor':
    ensure => present,
    source => 'puppet://puppet/nagios/check_ipmi_sensor',
    group  => 'nagios',
    owner  => 'nagios',
    mode   => '0554'
    }

	file { '/etc/init.d/nrpe':
    ensure => present,
    source => 'puppet://puppet/nagios/nrpe.initd_script',
    group  => 'root',
    owner  => 'root',
    mode   => '0755',
	notify => Service['nrpe']
    }

	file { '/usr/lib64/nagios/plugins/check_ng_md_raid.sh':
    ensure => present,
    source => 'puppet://puppet/nagios/check_ng_md_raid.sh',
    group  => 'nagios',
    owner  => 'nagios',
    mode   => '0554'
    }
	
	file { '/usr/lib64/nagios/plugins/check_munin.pl':
    ensure => present,
    source => 'puppet://puppet/nagios/check_munin.pl',
    group  => 'nagios',
    owner  => 'nagios',
    mode   => '0554'
    }
	
	file { '/usr/lib64/nagios/plugins/check_iostat.sh':
    ensure => present,
    source => 'puppet://puppet/nagios/check_iostat.sh',
    group  => 'nagios',
    owner  => 'nagios',
    mode   => '0554'
    }	

    service { 'nrpe':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    subscribe  => [File['/etc/nagios/nrpe.cfg']]
    }
	

}