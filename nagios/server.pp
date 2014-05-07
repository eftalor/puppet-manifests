class nagios::server {


    package {'nagios':
    ensure => installed,
    alias  => 'nagios',
    }

    file {'/etc/nagios/nagios.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/nagios.cfg.erb'),
    notify  => Service['nagios']
    }

    file {'/etc/nagios/':
    group => 'nagios',
    owner => 'nagios',
    mode  => '0644',
    }

    file{'/etc/nagios/hosts.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/nagios_hosts.cfg.erb'),
    notify  => Service['nagios']
    }

    file{'/etc/nagios/host_groups.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/nagios_host_groups.cfg.erb'),
    notify  => Service['nagios']
    }

    file{'/etc/nagios/services.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/nagios_services.cfg.erb'),
    notify  => Service['nagios']
    }

    file{'/etc/nagios/contacts.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/nagios_contacts.cfg.erb'),
    notify  => Service['nagios']
    }

    file{'/etc/nagios/commands.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/commands.cfg.erb'),
    notify  => Service['nagios']
    }

    file{'/etc/nagios/timeperiods.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/timeperiods.cfg.erb'),
    notify  => Service['nagios']
    }

    file{'/etc/nagios/templates.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/nagios_templates.cfg.erb'),
    notify  => Service['nagios']
    }

    file{'/usr/lib64/nagios/plugins/cassandra_status.sh':
    ensure => present,
    group  => 'nagios',
    owner  => 'nagios',
    mode   => '0554',
    source => 'puppet://puppet/nagios/cassandra_status.sh',
    notify => Service['nagios']
    }

    file{'/etc/nagios/switches.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/nagios_switches.cfg.erb'),
    notify  => Service['nagios']
    }

    file{'/etc/nagios/servicegroups.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/nagios_servicegroups.cfg.erb'),
    notify  => Service['nagios']
    }

    file{'/etc/nagios/host_dep.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/nagios_host_dep.cfg.erb'),
    notify  => Service['nagios']
    }

	file{'/etc/nagios/host_ext_info.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/nagios_host_ext_info.cfg.erb'),
    notify  => Service['nagios']
    }

    service { 'nagios':
    ensure     => running,
    alias      => 'nagios',
    hasstatus  => true,
    hasrestart => true,
    require    => Package[nagios]
    }

	package {'nagios-nsca':
    ensure => installed,
    alias  => 'nagios-nsca',
    }	

    service { 'nsca':
    ensure     => running,
    alias      => 'nsca',
    hasstatus  => true,
    hasrestart => true,
    require    => Package[nagios-nsca]
    }	
	
    file {'/etc/nagios/nsca.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/nagios-nsca.cfg.erb'),
    notify  => Service['nsca']
    }

	
}