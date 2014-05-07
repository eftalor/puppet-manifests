class nagios::nsca {

package {'nagios-nsca-client':
    ensure => installed,
    alias  => 'nagios-nsca-client',
    }

	file {'/etc/nagios/send_nsca.cfg':
    ensure  => present,
    group   => 'nagios',
    owner   => 'nagios',
    mode    => '0644',
    content => template('nagios/send_nsca.cfg.erb'),
    notify  => Service['nagios']
    }

	
}