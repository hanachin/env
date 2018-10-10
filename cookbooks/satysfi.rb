# setup opam

package "bubblewrap"

execute "wget -O /usr/local/bin/opam https://github.com/ocaml/opam/releases/download/2.0.0/opam-2.0.0-x86_64-linux && chmod 755 /usr/local/bin/opam" do
  not_if "[ -x /usr/local/bin/opam ]"
end

execute "opam init --auto-setup --comp 4.06.0" do
  user "sei"
  not_if 'eval $(opam env) && [ -n "$(ocaml -version | grep 4.06.0)" ]'
end

# build dep
package "build-essential"
package "git"
package "m4"
package "unzip"
package "wget"

execute 'eval "$(opam env)" && opam repository add satysfi-external https://github.com/gfngfn/satysfi-external-repo.git && opam update' do
  user "sei"
  not_if 'eval "$(opam env)" && [ -n "$(opam repository list | grep satysfi)" ]'
end

github_repo "gfngfn/SATySFi"

execute 'eval "$(opam env)" && opam pin add satysfi . --yes && opam install satysfi --yes' do
  user "sei"
  cwd "/home/sei/src/github.com/gfngfn/SATySFi"
  not_if '[ -n "$(opam list -i | grep SATySFi)" ]'
end

# work around for
# https://github.com/gfngfn/SATySFi/issues/38
directory "/home/sei/.satysfi" do
  group "sei"
  owner "sei"
end

link "/home/sei/.satysfi/dist" do
  user "sei"
  to "/home/sei/.opam/4.06.0/share/satysfi/dist"
end

# for emacs
github_repo "gfngfn/satysfi.el"
