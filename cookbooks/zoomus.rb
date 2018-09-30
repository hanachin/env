package "libxcb-xtest0"
execute "wget -qO /tmp/zoom_amd64.deb https://zoom.us/client/latest/zoom_amd64.deb && dpkg --install /tmp/zoom_amd64.deb" do
  not_if "[ -x /usr/bin/zoom ]"
end
