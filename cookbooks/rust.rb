execute "wget -qO - https://sh.rustup.rs | sh -s - -y" do
  user "sei"
  not_if "[ -x ~/.cargo/bin/rustup ]"
end

execute "~/.cargo/bin/cargo install cargo-deb" do
  user "sei"
  not_if '[ -n "$(~/.cargo/bin/cargo list | grep deb)" ]'
end
