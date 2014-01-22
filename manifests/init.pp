# a module which install vagrant, since it lacks PPA its akward
class vagrant {
  $url  = 'http://dl.bintray.com/mitchellh/vagrant/'
  $version = '1.4.2'
  $deb  = "vagrant_${version}_x86_64.deb"

  exec{'download vagrant deb':
    command => "wget -P /tmp ${url}/${deb}",
    user    => 'root',
    path    => ['/usr/bin','/bin'],
    unless  => "which vagrant && /usr/bin/vagrant -v | /bin/grep ${version}"
  } ->

  exec{'install vagrant deb':
    command => "dpgk -i /tmp/${deb}",
    user    => 'root',
    path    => ['/usr/bin','/bin',],
    unless  => "which vagrant && /usr/bin/vagrant -v | /bin/grep ${version}"
  }
  
}