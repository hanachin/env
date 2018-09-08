package "git"
package "make"
package "libgnome-keyring-dev"

execute "make" do
  cwd "/usr/share/doc/git/contrib/credential/gnome-keyring"
  not_if "[ -x /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring ]"
end
