package "sudo"
package "zsh"
package "zplug"

execute "chsh -s /bin/zsh sei" do
  not_if "sudo -u sei sh -c 'echo $SHELL | grep zsh'"
end
