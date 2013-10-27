# a module which install vagrant, since it lacks PPA its akward
class vagrant {
  $url  = 'http://files.vagrantup.com/packages'
  $hash = 'a40522f5fabccb9ddabad03d836e120ff5d14093'
  $deb  = 'vagrant_1.3.5_x86_64.deb'

  exec{'download vagrant deb':
    command => "wget -P /tmp ${url}/${hash}/${deb}",
    user    => 'root',
    path    => ['/usr/bin','/bin'],
    unless  => 'which vagrant'
  } ->

  package{'vagrant':
    ensure   => latest,
    source   => "/tmp/${deb}",
    provider => dpkg
  }
}
