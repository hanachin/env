apt_key "https://packages.microsoft.com/keys/microsoft.asc" do
  key_id "BC52 8686 B50D 79E3 39D3  721C EB3E 94AD BE12 29CF"
end

execute "apt update" do
  subscribes :run, "file[/etc/apt/sources.list.d/vscode.list]", :immediately
  action :nothing
end

file "/etc/apt/sources.list.d/vscode.list" do
  content "deb https://packages.microsoft.com/repos/vscode stable main\n"
end

package "code"
