execute "wget -qO /tmp/dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb && apt install -y /tmp/dropbox.deb" do
  not_if "[ -x /usr/bin/dropbox ]"
end
