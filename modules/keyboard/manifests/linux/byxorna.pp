class keyboard::linux::byxorna {
  Class['code'] -> Class['keyboard::linux::byxorna']

  $repo = "${::code::dir}/german_linux_layout"
  vcsrepo {
    $repo:
      ensure   => 'present',
      provider => 'git',
      source   => 'git@github.com:byxorna/german_linux_layout.git';
  }

  # todo: find a better way to install these. symlink? source from git repo?
  exec {
    'install-byxorna-keymap':
      command => 'sudo ./bin/install.sh',
      cwd     => $repo,
      creates => '/usr/share/X11/xkb/symbols/de_byxorna',
      path    => '/usr/bin:/bin:/usr/sbin:/sbin';
  }
}
