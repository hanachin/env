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

