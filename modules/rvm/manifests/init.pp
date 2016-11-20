# installs user rvm
class rvm {

  package { 'curl':
    ensure => installed;
  }

  exec { 'gpg_key':
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3";
  }

  exec { 'install_rvm':
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "curl -L https://get.rvm.io | bash -s stable",
    creates => "${home}/.rvm/bin/rvm",
    require => [Package['curl'], Exec['gpg_key']];
  }
}
