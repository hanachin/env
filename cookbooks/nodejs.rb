execute "wget -qO - https://nodejs.org/dist/v10.10.0/node-v10.10.0-linux-x64.tar.xz | tar --xz -xf - -C /usr/local" do
  not_if "[ -d /usr/local/node-v10.10.0-linux-x64 ]"
end

file "/etc/profile.d/nodejs.sh" do
  content "export PATH=$PATH:/usr/local/node-v10.10.0-linux-x64/bin\n"
  mode "0644"
  owner "root"
  group "root"
end
