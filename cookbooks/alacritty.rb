package "cmake"
package "libfreetype6-dev"
package "libfontconfig1-dev"
package "xclip"

github_repo "hanachin/alacritty"

execute "~/.cargo/bin/cargo deb --install --verbose" do
  user "sei"
  cwd "/home/sei/src/github.com/hanachin/alacritty"
  not_if "[ -x /usr/local/bin/alacritty ]"
end
