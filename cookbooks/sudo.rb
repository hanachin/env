# sudo (needs reboot)
package "sudo"
execute "adduser sei sudo" do
  not_if "groups sei | grep sudo"
end
