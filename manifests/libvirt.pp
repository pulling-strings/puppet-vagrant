# Setting up libvirt plugins
class vagrant::libvirt {

  package{['libxslt-dev', 'libxml2-dev', 'libvirt-dev', 'qemu-utils']:
    ensure  => present
  } ->

  vagrant::plugin{['vagrant-libvirt', 'vagrant-mutate']:
    user => $::vagrant::plugins::user,
    home => $::vagrant::home
  }
    
}
