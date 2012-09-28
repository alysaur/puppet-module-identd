# Class: identd::params
#
#   The identd configuration settings.

class identd::params {

  case $::osfamily {
    'Debian': {
      $packagename   = 'oidentd'
      $filepath      = '/etc/oidentd.conf'
      $filesource    = 'puppet:///modules/identd/oidentd.conf'
      $rootowner     = 'root'
      $rootgroup     = 'root'
      $servicename   = 'oidentd'
      $hasstatusval  = false
    }
    'FreeBSD': {
      $packagename   = 'security/oidentd'
      $filepath      = '/usr/local/etc/oidentd.conf'
      $filesource    = 'puppet:///modules/identd/oidentd.conf'
      $rootowner     = 'root'
      $rootgroup     = 'wheel'
      $servicename   = 'oidentd'
      $hasstatusval  = true
    }
    'RedHat': {
      $packagename   = 'oidentd'
      $filepath      = '/etc/oidentd.conf'
      $filesource    = 'puppet:///modules/identd/oidentd.conf'
      $rootowner     = 'root'
      $rootgroup     = 'root'
      $servicename   = 'oidentd'
      $hasstatusval  = true
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily},\
      module ${module_name} only supports osfamily \
      Debian, or FreeBSD")
    }
  }
}
