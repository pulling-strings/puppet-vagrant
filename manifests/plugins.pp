# Setting up vagrant plugins
class vagrant::plugins(
  $plugins=[],
  $user
) {

  if($plugins!=[]){
    vagrant::plugin{$plugins:
      user => $user,
      home => $::vagrant::home
    }
  }
}
