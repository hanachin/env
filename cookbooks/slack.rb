package "gconf2"
package "libappindicator1"
execute "wget -qO /tmp/slack-desktop.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.1-amd64.deb && apt install -y /tmp/slack-desktop.deb" do
  not_if "[ -x /usr/bin/slack ]"
end
