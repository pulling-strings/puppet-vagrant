# Setting up libvirt plugins
class vagrant::libvirt {

  if($::operatingsystem == 'Ubuntu' and $::lsbdistrelease == '15.04'){
    file{'/opt/vagrant/embedded/lib/liblzma.so.5':
      ensure => link,
      target => '/usr/lib/liblzma.so.5'
    } ->

    file{'/opt/vagrant/embedded/lib/liblzma.so.5.0.0':
      ensure => link,
      target => '/usr/lib/liblzma.so.5.0.0'
    } -> Vagrant::Plugin['vagrant-libvirt', 'vagrant-mutate']
  }

  package{['libxslt-dev', 'libxml2-dev', 'libvirt-dev', 'qemu-utils']:
    ensure  => present
  } ->

  vagrant::plugin{['vagrant-libvirt', 'vagrant-mutate']:
    user => $::vagrant::plugins::user,
    home => $::vagrant::home
  }
    
}
