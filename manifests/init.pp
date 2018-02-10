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
  $version = '2.0.2'

  $url = "https://releases.hashicorp.com/vagrant/${version}"

  $deb  = "vagrant_${version}_x86_64.deb"


  downloadfile::and_md5check {'download vagrant deb':
      url    => "${url}/${deb}",
      dest   => "/usr/src/${deb}",
      md5sum => '41f688a6ebe314bd67bc0968838e68fe',
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
