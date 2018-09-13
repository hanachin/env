package "cmake"
package "libfreetype6-dev"
package "libfontconfig1-dev"
package "xclip"

github_repo "jwilm/alacritty"

execute "~/.cargo/bin/cargo deb --install --verbose" do
  user "sei"
  cwd "/home/sei/src/github.com/jwilm/alacritty"
  not_if "[ -x /usr/local/bin/alacritty ]"
end
