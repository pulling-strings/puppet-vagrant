# Vagrant environment variables
class vagrant::environment(
  $ifc = 'eth0',
  $provider='libvirt'
){

  file_line { 'default ifc':
    path => '/etc/environment',
    line => "VAGRANT_BRIDGE=${ifc}"
  }

  file_line { 'default provider':
    path => '/etc/environment',
    line => "VAGRANT_DEFAULT_PROVIDER=${provider}"
  }
}
