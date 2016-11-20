# name should be like 1.4.2
define gvm::version(
  $default = false,
  $binary = false,
  $bootstrap_version = '1.4.2',
) {

  $version = "go${name}"

  if $binary {
    $extra_args = '--binary'
  } else {
    $extra_args = ''
  }

  exec { "install-${version}":
    environment => ["HOME=${home}","GOROOT_BOOTSTRAP=${home}/.gvm/gos/go${bootstrap_version}"],
    path        => '/usr/bin:/bin:/usr/sbin:/sbin',
    command     => "bash -c 'source ${home}/.gvm/scripts/gvm && gvm install ${version} ${extra_args}'",
    unless      => "bash -c 'source ${home}/.gvm/scripts/gvm && gvm list | grep ${version}'";
  }

  if $default {
    exec { "use-${version}-default":
      environment => ["HOME=${home}"],
      path        => '/usr/bin:/bin:/usr/sbin:/sbin',
      command     => "bash -c 'source ${home}/.gvm/scripts/gvm && gvm use ${version} --default'",
      unless      => "bash -c 'source ${home}/.gvm/scripts/gvm && gvm list | grep \"^=> ${version}\"'";
    }
  }
}
