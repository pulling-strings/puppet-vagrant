# a module which install vagrant, since it lacks PPA its akward
class vagrant(
  $home = false,
  $user = false,
) {
  include vagrant::nfs
  include vagrant::plugins
  include vagrant::environment
  include downloadfile

  validate_string($home, $user)
  $version = '2.0.1'

  $url = "https://releases.hashicorp.com/vagrant/${version}"

  $deb  = "vagrant_${version}_x86_64.deb"


  downloadfile::and_md5check {'download vagrant deb':
      url    => "${url}/${deb}",
      dest   => "/usr/src/${deb}",
      md5sum => '6b5eb1f84e8c42e984c9b08800a4cade',
      user   => $::id,
      group  => $::gid,
      chmod  => '770'
  }

  package{'vagrant':
    ensure   => latest,
    source   => "/usr/src/${deb}",
    provider => dpkg,
    require  => Downloadfile::And_md5check['download vagrant deb']
  }

}
