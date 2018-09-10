execute "wget -qO - https://dl.google.com/go/go1.11.linux-amd64.tar.gz | tar -C /usr/local -xzf -" do
  not_if "[ -d /usr/local/go ]"
end

file "/etc/profile.d/go.sh" do
  content "export PATH=$PATH:/usr/local/go/bin\n"
  mode "0644"
  owner "root"
  group "root"
end
