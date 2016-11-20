class code::osx {

  if $::osfamily == 'Darwin' {
    package {
      ['mercurial']:
        ensure   => 'installed',
        provider => 'brew';
    }
    exec {
      "do-xcode-shit":
        command => 'xcode-select --install',
        path    => '/usr/bin:/bin:/usr/sbin:/sbin';
    }
  } else {
    fail("This wont work on ${::osfamily}")
  }

}
