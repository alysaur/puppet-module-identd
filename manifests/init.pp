class identd {
  case $operatingsystem {
    "ubuntu","debian": {
      package { "identd":
        name   => "oidentd",
        ensure => "installed",
      }
      service { "identd":
	hasstatus => false,
	pattern   => "/usr/sbin/oidentd",
        enable    => true,
        ensure    => "running",
        name      => "oidentd",
        require   => Package["identd"];

      }
    }
    default: {
      notify { "ident module not configured for $operatingsystem":; }
    }
  }
}
