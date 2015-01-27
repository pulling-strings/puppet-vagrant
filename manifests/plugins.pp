# Setting up vagrant plugins
class vagrant::plugins(
  $plugins=[],
  $home,
  $user
) {

  if($plugins!=[]){
    vagrant::plugin{$plugins:
      user => $user,
      home => $home
    }
  }
}
