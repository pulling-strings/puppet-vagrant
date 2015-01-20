# a module which install vagrant, since it lacks PPA its akward
class vagrant($user='') {
  include vagrant::pecrant
  include vagrant::nfs

  $url  = 'https://dl.bintray.com/mitchellh/vagrant/'
  $version = '1.7.2'

  $deb  = "vagrant_${version}_x86_64.deb"

  exec{'download vagrant deb':
    command     => "wget -P /tmp ${url}/${deb}",
    environment => ['HOME=/home/ronen/'],
    user        => 'root',
    path        => ['/usr/bin','/bin'],
    unless      => "test -f /usr/bin/vagrant && (/usr/bin/vagrant -v | /bin/grep ${version})"
  } ~>

  exec{'install vagrant deb':
    command      => "dpkg -i /tmp/${deb}",
    refreshonly => true,
    user         => 'root',
    path         => ['/usr/bin','/bin','/usr/local/sbin', '/usr/sbin', '/sbin'],
  }

}
