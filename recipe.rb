include_recipe "helper"
include_recipe "cookbooks/docker"
include_recipe "cookbooks/docker-compose"
include_recipe "cookbooks/dotfiles"
include_recipe "cookbooks/envchain"
include_recipe "cookbooks/ghq"
include_recipe "cookbooks/git"
include_recipe "cookbooks/go"
include_recipe "cookbooks/google-chrome"
include_recipe "cookbooks/peco"
include_recipe "cookbooks/rcm"
include_recipe "cookbooks/sudo"
include_recipe "cookbooks/vscode"
include_recipe "cookbooks/xremap"
include_recipe "cookbooks/zsh"
include_recipe "rbenv::user"
package "emacs"
package "tig"
package "tmux"
