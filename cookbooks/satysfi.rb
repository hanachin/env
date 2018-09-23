package "opam"

execute "opam init -a" do
  user "sei"
  not_if "[ -d ~/.opam ]"
end

package "build-essential"
package "git"
package "m4"
package "unzip"
package "wget"

execute "opam switch 4.06.0 && eval `ocaml config env`" do
  user "sei"
  not_if '[ -n "$(ocaml -version | grep 4.06.0)" ]'
end

execute "opam repository add satysfi-external https://github.com/gfngfn/satysfi-external-repo.git && opam update" do
  user "sei"
  not_if '[ -n "$(opam repository list | grep satysfi)" ]'
end

github_repo "gfngfn/SATySFi"

execute "opam pin add satysfi . --yes && opam install satysfi --yes" do
  user "sei"
  cwd "/home/sei/src/github.com/gfngfn/SATySFi"
  not_if '[ -n "$(opam pin list | grep -i satysfi)" ]'
end
