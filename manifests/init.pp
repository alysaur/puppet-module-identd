class identd {
  include identd::params

  package { 'identd':
    ensure => 'installed',
    name   => $identd::params::packagename,
  }

  file { 'oidentd.conf':
    path    => $identd::params::filepath,
    source  => $identd::params::filesource,
    owner   => $identd::params::rootowner,
    group   => $identd::params::rootgroup,
    mode    => '0644',
    require => Package['identd'],
  }

  service { 'identd':
    ensure    => 'running',
    name      => $identd::params::servicename,
    enable    => true,
    hasstatus => $identd::params::hasstatusval,
    provider  => $::identd::params::service_provider,
    require   => File['oidentd.conf'],
  }
}
