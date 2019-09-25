git "/home/sei/.asdf" do
  repository "https://github.com/asdf-vm/asdf.git"
  user "sei"
  not_if "[ -d /home/sei/.asdf ]"
end

execute "/home/sei/.asdf/bin/asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git && bash /home/sei/.asdf/plugins/nodejs/bin/import-release-team-keyring" do
  user "sei"
  not_if "/home/sei/.asdf/bin/asdf plugin-list | grep node"
end
