include_recipe "helper"
include_recipe "cookbooks/asdf"
include_recipe "cookbooks/criu"
include_recipe "cookbooks/docker"
include_recipe "cookbooks/docker-compose"
include_recipe "cookbooks/dotfiles"
include_recipe "cookbooks/dropbox"
include_recipe "cookbooks/envchain"
include_recipe "cookbooks/esp-idf"
include_recipe "cookbooks/ghq"
include_recipe "cookbooks/git"
include_recipe "cookbooks/go"
include_recipe "cookbooks/google-chrome"
include_recipe "cookbooks/nodejs"
include_recipe "cookbooks/peco"
include_recipe "cookbooks/postgresql"
include_recipe "cookbooks/rcm"
include_recipe "cookbooks/rust"
include_recipe "cookbooks/rust-racer"
include_recipe "cookbooks/alacritty" # depends on rust
include_recipe "cookbooks/rails"
include_recipe "cookbooks/satysfi"
include_recipe "cookbooks/slack"
include_recipe "cookbooks/sudo"
include_recipe "cookbooks/vscode"
include_recipe "cookbooks/xremap"
include_recipe "cookbooks/yarn"
include_recipe "cookbooks/zsh"
include_recipe "cookbooks/zoomus"
# include_recipe "rbenv::user"
package "emacs"
package "emacs25"
package "tig"
package "tmux"
package "fprintd"
package "jq"
package "snapd"
package "mercurial"
package "time"
package "curl"
package "tree"
package "subversion"
package "rsync"

# rmagick
package "libmagickwand-dev"

# musl
package "musl"
package "musl-dev"
package "musl-tools"

# os
package "qemu"
package "nasm"
package "mtools"

# racc
package "ragel"

# misc
package "hub"
