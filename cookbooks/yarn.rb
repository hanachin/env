apt_key "https://dl.yarnpkg.com/debian/pubkey.gpg" do
  key_id "72EC F46A 56B4 AD39 C907 BBB7 1646 B01B 86E5 0310"
end

execute "apt update" do
  subscribes :run, "file[/etc/apt/sources.list.d/yarn.list]", :immediately
  action :nothing
end

file "/etc/apt/sources.list.d/yarn.list" do
  content "deb https://dl.yarnpkg.com/debian/ stable main\n"
end

package "yarn"
