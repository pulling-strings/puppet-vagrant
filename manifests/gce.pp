# Setting up GCE plugin
class vagrant::gce {
  vagrant::plugin{'vagrant-google':
    user => $::vagrant::plugins::user,
    home => $::vagrant::home
  }

  vagrant::box {'gce':
    source => 'https://github.com/mitchellh/vagrant-google/raw/master/google.box',
    user   => $::vagrant::user,
    home   => $::vagrant::home
  }
}
