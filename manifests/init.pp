class identd {
  case $operatingsystem {
    'ubuntu','debian': {
      package { 'identd':
        name   => 'oidentd',
        ensure => 'installed',
      }
      file { 'oidentd.conf':
        path    => '/etc/oidentd.conf',
        source  => 'puppet:///modules/identd/oidentd.conf',
        owner   => 'root',
        group   => 'root',
        mode    => 0644,
        require => Package['identd'],
      }
      service { 'identd':
        name      => 'oidentd',
        ensure    => 'running',
        enable    => true,
        hasstatus => false,
        require   => File['oidentd.conf'],
      }
    }
    'freebsd': {
      package { 'identd':
        name   => 'security/oidentd',
        ensure => 'installed',
      }
      file { 'oidentd.conf':
        path    => '/usr/local/etc/oidentd.conf',
        source  => 'puppet:///modules/identd/oidentd.conf',
        owner   => 'root',
        group   => 'wheel',
        mode    => 0644,
        require => Package['identd'],
      }
      service { 'identd':
        name    => 'oidentd',
        ensure  => 'running',
        enable  => true,
        require => File['oidentd.conf'],
      }
    }
    default: {
      notify { 'identd':
        message => "ident module not configured for $operatingsystem",
      }
    }
  }
}
