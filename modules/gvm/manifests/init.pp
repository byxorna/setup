# installs user gvm
class gvm {
  exec {
    'install-gvm':
      path        => '/usr/bin:/bin:/usr/sbin:/sbin',
      environment => ["HOME=${home}"],
      command     => "curl -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash",
      logoutput   => true,
      creates     => "${home}/.gvm/bin/gvm";
  }
}


