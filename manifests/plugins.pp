# Setting up vagrant plugins
class vagrant::plugins(
  $plugins=[],
  $home='/home/vagrant',
  $user='vagrant'
) {

  $joined = join($plugins,' ')

  exec{'vagrant plugins':
    command     => "vagrant plugin install ${joined}",
    user        => $user,
    path        => ['/usr/bin','/bin',],
    environment => ["HOME=${home}"],
    refreshonly => true
  }

}
