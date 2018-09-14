define :apt_key, key_id: nil do
  key_id = params[:key_id]
  url = params[:name]

  raise "Please specify key_id for #{url}" unless key_id

  execute "wget -qO - #{url} | apt-key add -" do
    only_if %([ -z "$(apt-key list '#{key_id}')" ])
  end
end

define :executable, url: nil, binary_path: nil do
  dest_path = params[:name]
  url = params[:url]

  raise "Please specify url for #{dest_path}" unless url

  if binary_path = params[:binary_path]
    if url.end_with?(".gz")
      cmd = "wget -qO - #{url} | tar xzOf - #{binary_path} > #{dest_path} && chmod +x #{dest_path}"
    elsif url.end_with?(".zip")
      cmd = "wget -qO /tmp/exe.zip #{url} && unzip -p /tmp/exe.zip #{binary_path} > #{dest_path} && rm /tmp/exe.zip && chmod +x #{dest_path}"
    end
  else
    cmd = "wget -qO #{dest_path} #{url} && chmod +x #{dest_path}"
  end

  execute cmd do
    not_if "[ -x #{dest_path} ]"
  end
end

define :build_from_source, cmd: nil, url: nil do
  cmd = params[:cmd]
  dest_path = params[:name]
  url = params[:url]

  raise "Please specify url for #{dest_path}" unless url
  raise "Please specify cmd to build #{dest_path}" unless cmd

  execute "wget -qO src #{url} && tar xf src && #{cmd}" do
    cwd "/tmp"
    not_if "[ -x #{dest_path} ]"
  end
end

# based on
#   https://github.com/k0kubun/dotfiles/blob/6256d5aa61099b5c14eb0371d7c7ec23dd13792e/cookbooks/functions/default.rb#L39-L54
define :user_service, action: [] do
  name = params[:name]

  Array(params[:action]).each do |action|
    case action
    when :enable
      execute %(su -lc 'DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u sei)/bus" systemctl --user enable #{name}' sei) do
        not_if %(su -lc 'DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u sei)/bus" systemctl --user --quiet is-enabled #{name}' sei)
      end
    when :start
      execute %(su -lc 'DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u sei)/bus" systemctl --user start #{name}' sei) do
        not_if %(su -lc 'DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u sei)/bus" systemctl --user --quiet is-active #{name}' sei)
      end
    end
  end
end

directory "/home/sei/src" do
  owner "sei"
  group "sei"
end

directory "/home/sei/src/github.com/" do
  owner "sei"
  group "sei"
end

define :github_repo do
  name = params[:name]
  username = name.split("/")[0]
  directory "/home/sei/src/github.com/#{username}" do
    owner "sei"
    group "sei"
  end

  git "/home/sei/src/github.com/#{name}" do
    repository "https://github.com/#{name}.git"
    user "sei"
  end
end
