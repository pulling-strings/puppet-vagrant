# Setting up vagrant plugins
class vagrant::plugins(
  $plugins=[],
  $user=undef
) {

  if($plugins!=[]){
    validate_string($user)
    vagrant::plugin{$plugins:
      user => $user,
      home => $::vagrant::home
    }
  }
}
