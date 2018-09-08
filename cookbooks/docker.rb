apt_key "https://download.docker.com/linux/debian/gpg" do
  key_id "9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88"
end

execute "apt update" do
  subscribes :run, "file[/etc/apt/sources.list.d/docker.list]", :immediately
  action :nothing
end

file "/etc/apt/sources.list.d/docker.list" do
  content "deb https://download.docker.com/linux/debian stretch stable"
end

package "docker-ce"

execute "adduser sei docker" do
  not_if "groups sei | grep docker"
end

