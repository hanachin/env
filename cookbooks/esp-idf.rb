# toolchain
package "gcc"
package "git"
package "wget"
package "make"
package "libncurses-dev"
package "flex"
package "bison"
package "gperf"
package "python"
package "python-pip"
package "python-setuptools"
package "python-serial"


directory "/home/sei/esp" do
  owner "sei"
  group "sei"
end

execute "wget -qO - https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz | tar -xzf -" do
  user "sei"
  cwd "/home/sei/esp"
  not_if "[ -d /home/sei/esp/xtensa-esp32-elf ]"
end

# ESP-IDF
execute "git clone --recursive https://github.com/espressif/esp-idf" do
  user "sei"
  cwd "/home/sei/esp"
  not_if "[ -d /home/sei/esp/esp-idf ]"
  notifies :run, "execute[python2.7 -m pip install --user -r requirements.txt]", :immediately
end

execute "python2.7 -m pip install --user -r requirements.txt" do
  user "sei"
  cwd "/home/sei/esp/esp-idf"
  action :nothing
end
