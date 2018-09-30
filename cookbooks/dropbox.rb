execute "wget -O - 'https://www.dropbox.com/download?plat=lnx.x86_64' | tar xzf -" do
  cwd "/home/sei"
  user "sei"
  not_if "[ -d ~/.dropbox-dist ]"
end
