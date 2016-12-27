# a module which install vagrant, since it lacks PPA its akward
class vagrant(
  $home = false,
  $user = false
) {
  include vagrant::nfs
  include vagrant::plugins

  validate_string($home, $user)
  $version = '1.8.7'

  $url = "https://releases.hashicorp.com/vagrant/${version}"

  $deb  = "vagrant_${version}_x86_64.deb"

  exec{'download vagrant deb':
    command     => "wget -P /usr/src/ ${url}/${deb}",
    environment => ["HOME=${home}"],
    user        => 'root',
    path        => ['/usr/bin','/bin'],
    timeout     => '1200',
    unless      => "test -f /usr/src/${deb}"
  } ->

  package{'vagrant':
    ensure   => latest,
    source   => "/usr/src/${deb}",
    provider => dpkg
  }

}
