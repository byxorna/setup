define rvm::version(
  $default = false,
){
	include rvm

  exec { "install-ruby-${name}":
    command   => "${home}/.rvm/bin/rvm install ${name} --autolibs=enabled",
    unless    => "${home}/.rvm/bin/rvm list|grep ' ruby-${name} '",
    logoutput => true,
    require   => Class['rvm'];
  }

  if $default {
    exec { "set-ruby-${name}-default":
      command   => "${home}/.rvm/bin/rvm --fuzzy alias create default ${name}",
      unless    => "${home}/.rvm/bin/rvm list|grep '\\* ruby-${name} '",
      logoutput => true,
      require   => Exec["install-ruby-${name}"];
    }
  }
}
