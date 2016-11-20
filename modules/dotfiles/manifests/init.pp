class dotfiles {
  file {
    "${home}/.bashrc":
      ensure => 'link',
      target => "${::code::dir}/dotfiles/bashrc";
    "${home}/.vimrc":
      ensure => 'link',
      target => "${::code::dir}/dotfiles/vimrc";
    "${home}/.vim":
      ensure => 'link',
      target => "${::code::dir}/dotfiles/vim";
    "${home}/.tmux.conf":
      ensure => 'link',
      target => "${::code::dir}/dotfiles/tmux.conf";
  }

  if $::osfamily == 'Darwin' {
    file {
      "${home}/.bashrc-osx":
        ensure => 'link',
        target => "${::code::dir}/dotfiles/bashrc-osx";
    }
  }
}
