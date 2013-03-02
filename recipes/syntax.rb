
include_recipe "git"

overlay_dir = node['joe']['overlay_dir']

directory overlay_dir do
  owner "root"
  group "root"
  recursive true
end

git overlay_dir do
  repository node['joe']['overlay_repo']
  reference "master"
  user "root"
  group "root"
  action :sync
end

template "#{overlay_dir}/setup-symlinks.sh" do
  source "setup-symlinks.sh.erb"
  owner "root"
  group "root"
  mode 00755
  variables(:source => overlay_dir, :dest => node['joe']['target_dir'])
end

execute "setup-symlinks" do
  command "#{overlay_dir}/setup-symlinks.sh"
end

link "#{node['joe']['etc_dir']}/ftyperc" do
  to "#{overlay_dir}/ftyperc"
  owner "root"
  group "root"
end
