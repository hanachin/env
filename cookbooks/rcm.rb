# fix E: メソッドドライバ /usr/lib/apt/methods/https が見つかりません。
package "apt-transport-https"

apt_key "https://apt.thoughtbot.com/thoughtbot.gpg.key" do
  key_id "C31D 841D 55AC EC14 71D2  2CC9 84D7 308E BE7F EF18"
end

execute "apt update" do
  subscribes :run, "file[/etc/apt/sources.list.d/thoughtbot.list]", :immediately
  action :nothing
end

file "/etc/apt/sources.list.d/thoughtbot.list" do
  content "deb https://apt.thoughtbot.com/debian/ stable main\n"
end

package "rcm"
