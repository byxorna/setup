class code {
  include code::ruby
  include code::go
  if $::osfamily == 'Darwin' {
    include code::osx
  }

  $dir = "${::home}/code"
  file {
    $dir:
      ensure => 'directory';
  }

  vcsrepo {
    "${dir}/dotfiles":
      ensure     => present,
      provider   => git,
      submodules => true,
      source     => 'git@github.com:byxorna/dotfiles.git';
    "${dir}/scripts":
      ensure   => present,
      provider => git,
      source   => 'git@github.com:byxorna/scripts.git';
    "${dir}/setup":
      ensure     => present,
      provider   => git,
      submodules => true,
      source     => 'git@github.com:byxorna/setup.git';
  }

  if $::osfamily == 'Linux' {
    vcsrepo {
      "${dir}/german_linux_layout":
        ensure   => present,
        provider => git,
        source   => 'git@github.com:byxorna/german_linux_layout.git';
    }
  }
}
