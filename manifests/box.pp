# Vagrant box management
define vagrant::box(
  $source = '',
  $user = '',
  $home = ''
){
  
  $command_base = "vagrant box add ${name} ${source}"

  exec{"vagrant-box-add-${name}":
    command     => $command_base,
    path        => '/opt/vagrant/bin:/usr/local/bin:/usr/bin:/bin',
    unless      => "vagrant box list | grep -q ${name}",
    user        => $user,
    provider    => shell,
    environment => ["HOME=${home}"],
    require     => Package[vagrant]
  }

}
