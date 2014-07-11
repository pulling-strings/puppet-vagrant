# pecrant setup
class vagrant::pecrant {
  $home = hiera('home')
  validate_string($home)

  $url = 'https://raw.githubusercontent.com/gongo/pecrant/master/pecrant'

  ensure_resource('file', "${home}/bin", {'ensure' => 'directory'})

  exec{'pecrant download':
    command => "wget -P ${home}/bin ${url}",
    user    => 'root',
    path    => ['/usr/bin','/bin'],
    require => File["${home}/bin"]
  } ->

  file{"${home}/bin/pecrant":
    mode => 'a+x'
  }
}
