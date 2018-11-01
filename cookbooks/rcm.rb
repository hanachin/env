case node[:platform]
when 'debian'
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
when 'amazon'
  execute "wget -qO /etc/yum.repos.d/utilities.repo wget https://download.opensuse.org/repositories/utilities/RHEL_7/utilities.repo" do
    not_if "[ -f /etc/yum.repos.d/utilities.repo ]"
  end
else
  raise "not supported platform: #{node[:platform]}"
end

package "rcm"
