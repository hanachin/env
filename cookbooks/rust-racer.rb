execute "~/.cargo/bin/rustup toolchain add nightly" do
  user "sei"
  not_if '[ -n "$(~/.cargo/bin/rustup toolchain list | grep nightly)" ]'
end

execute "~/.cargo/bin/rustup component add rust-src" do
  user "sei"
  not_if '[ -n "$(~/.cargo/bin/rustup component list | grep rust-src | grep installed )" ]'
end

execute "~/.cargo/bin/cargo +nightly install racer" do
  user "sei"
  not_if '[ -x ~/.cargo/bin/racer ]'
end
