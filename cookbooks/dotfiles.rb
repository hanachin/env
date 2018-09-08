execute "git clone https://github.com/hanachin/dotfiles.git /home/sei/.dotfiles" do
  user "sei"
  not_if "[ -d /home/sei/.dotfiles ]"
end

execute "rcup" do
  cwd "/home/sei"
  user "sei"
end
