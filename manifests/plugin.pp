define vagrant::plugin(
  $user,
  $home,
  $version=undef
  ) {
  $command_base = "vagrant plugin install $name"
  if $version != undef {
    $command = "${command_base} --plugin-version ${version}"
  } else {
    $command = $command_base
  }

  exec{"vagrant-plugin-install-$name":
    command => $command,
    path => "/opt/vagrant/bin:/usr/local/bin:/usr/bin:/bin",
    unless => "vagrant plugin list |grep -q $name",
    user => $user,
    provider => shell,
    environment => ["HOME=$home"],
    require => Package[vagrant]
  }
}
