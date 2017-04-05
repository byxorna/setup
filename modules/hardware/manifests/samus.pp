class hardware::samus {
  # setup audio shortcuts
  $homebin = "${home}/bin"
  $audioscripts = "${home}/code/linux-samus/scripts/setup/audio"
  file {
    "${homebin}":
      ensure => 'directory';
    "${homebin}/samus-enable-headphones":
      ensure => 'link',
      target => "${audioscripts}/enable-headphones.sh";
    "${homebin}/samus-enable-speakers":
      ensure => 'link',
      target => "${audioscripts}/enable-speakers.sh";
    "${homebin}/samus-mute-toggle":
      ensure => 'link',
      target => "${audioscripts}/mute-toggle.sh";
    "${homebin}/samus-volume-up":
      ensure => 'link',
      target => "${audioscripts}/volume-up.sh";
    "${homebin}/samus-volume-down":
      ensure => 'link',
      target => "${audioscripts}/volume-down.sh";
  }
}
