apt_key "https://dl.google.com/linux/linux_signing_key.pub" do
  key_id "4CCA 1EAF 950C EE4A B839 76DC A040 830F 7FAC 5991"
end

execute "apt update" do
  subscribes :run, "file[/etc/apt/sources.list.d/google-chrome.list]", :immediately
  action :nothing
end

file "/etc/apt/sources.list.d/google-chrome.list" do
  content "deb http://dl.google.com/linux/chrome/deb/ stable main\n"
end

package "google-chrome-stable"
