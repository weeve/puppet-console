# Parameters class for console module
class console::params {
  case $::osfamily {
    'RedHat', 'Debian': {
      $local_file = '/etc/rc.local'
    }
    'Suse': {
      $local_file = '/etc/init.d/boot.local'
    }
    default: {
      notify { "${module_name}_unsupported":
        message => "The ${module_name} module is not supported on ${::operatingsystem}",
      }
    }
  }
}
