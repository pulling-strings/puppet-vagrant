# a module which install vagrant, since it lacks PPA its akward
class vagrant($home) {
  include vagrant::nfs
  include vagrant::plugins

  $url  = 'https://dl.bintray.com/mitchellh/vagrant/'
  $version = '1.7.2'

  $deb  = "vagrant_${version}_x86_64.deb"

  exec{'download vagrant deb':
    command     => "wget -P /tmp ${url}/${deb}",
    environment => ["HOME=${home}"],
    user        => 'root',
    path        => ['/usr/bin','/bin'],
    unless      => "test -f /usr/bin/vagrant && (/usr/bin/vagrant -v | /bin/grep ${version})"
  } ~>

  package{'vagrant':
    ensure   => latest,
    source   => "/tmp/${deb}",
    provider => dpkg
  }

}
