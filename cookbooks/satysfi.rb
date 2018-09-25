# setup opam
package "opam"

execute "opam init -a" do
  user "sei"
  not_if "[ -d ~/.opam ]"
end

# build dep
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

# Add some fonts
package "fonts-ipaexfont"
package "fonts-junicode"

execute "cp /usr/share/fonts/truetype/junicode/Junicode.ttf /home/sei/.opam/4.06.0/share/satysfi/dist/fonts/Junicode.ttf" do
  user "sei"
  not_if "[ -f /home/sei/.opam/4.06.0/share/satysfi/dist/fonts/Junicode.ttf ]"
end

execute "cp /usr/share/fonts/opentype/ipaexfont-mincho/ipaexm.ttf /home/sei/.opam/4.06.0/share/satysfi/dist/fonts/ipaexm.ttf" do
  user "sei"
  not_if "[ -f /home/sei/.opam/4.06.0/share/satysfi/dist/fonts/ipaexm.ttf ]"
end

execute "cp /usr/share/fonts/opentype/ipaexfont-gothic/ipaexg.ttf /home/sei/.opam/4.06.0/share/satysfi/dist/fonts/ipaexg.ttf" do
  user "sei"
  not_if "[ -f /home/sei/.opam/4.06.0/share/satysfi/dist/fonts/ipaexg.ttf ]"
end

# for emacs
github_repo "gfngfn/satysfi.el"
