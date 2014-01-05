# Installation class for console module
class console::install {
  # Two steps here:
  # 1) disable screen blanking on current physical consoles
  # 2) disable screen blanking at boot time

  # Step 1, disable screen blanking on current physical consoles
  exec { 'disable_console_blanking':
    # Only run if setterm is not already in rc.local as that will be our
    # check for step 1 to see if we've already run this module
    unless  => "/bin/grep setterm ${console::params::local_file}",
    command => '/bin/echo -e \'\033[9;0]\033[14;0]\' > /dev/console',
    user    => 'root',
  }

  # Step 2, disable screen blainking at boot time
  file_line { 'disable_console_blanking_at_boot_time':
    ensure => present,
    line   => '/usr/bin/setterm -blank 0',
    path   => $console::params::local_file,
  }

  # Step 3, make sure the line "exit 0" doesn't exist in rc.local
  # (since we don't know what else may be managing it and we can't depend
  #  on it not being there)
  file_line { 'disable_exit_in_rc_local':
    ensure => absent,
    line   => 'exit 0',
    path   => $console::params::local_file,
  }

  # end class
}
