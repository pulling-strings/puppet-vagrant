# Managing vagrant NFS integration
class vagrant::nfs {
 
  # enabling passwordless nfs access
  file { '/etc/sudoers.d/vagrant':
    ensure=> file,
    mode  => '0644',
    source=> 'puppet:///modules/vagrant/vagrant-sudoer',
    owner => root,
    group => root,
  }

  package{'nfs-kernel-server':
    ensure  => present
  }
}
