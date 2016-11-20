class code {
  $codedir = "/home/${::id}/code"
  file {
    $codedir:
      ensure => 'directory';
  }

  vcsrepo {
    "${codedir}/dotfiles":
      ensure   => present,
      provider => git,
      source   => 'git@github.com:byxorna/dotfiles.git';
    "${codedir}/scripts":
      ensure   => present,
      provider => git,
      source   => 'git@github.com:byxorna/scripts.git';
    "${codedir}/setup":
      ensure   => present,
      provider => git,
      source   => 'git@github.com:byxorna/setup.git';
  }

  if $::osfamily == 'Linux' {
    vcsrepo {
      "${codedir}/german_linux_layout":
        ensure   => present,
        provider => git,
        source   => 'git@github.com:byxorna/german_linux_layout.git';
    }
  }
}
