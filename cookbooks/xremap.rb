# mruby dependencies
package "gcc"
package "binutils"
package "bison"
package "ruby"

# xremap dependencies
package "libx11-dev"

github_repo "k0kubun/xremap"

execute "make" do
  not_if "which xremap"
  cwd "/home/sei/src/github.com/k0kubun/xremap"
  user "sei"
end

execute "make install" do
  not_if "which xremap"
  cwd "/home/sei/src/github.com/k0kubun/xremap"
  notifies :run, "execute[rcup]", :immediately
end

user_service "xremap" do
  action [:enable, :start]
  only_if "which xremap"
end
