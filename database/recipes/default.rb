Chef::Log.info("foooooooooooooooooooooo")
Chef::Log.info(">>>>> #{node[:deployed_to_path]} <<<<<")
Chef::Log.info(">>>>> #{node[:database]} <<<<<")

# template '/home/chris/.env' do
template "#{node[:deployed_to_path]}/shared/config/database.yml" do
  source 'database.erb'
  owner 'deploy'
  group 'nginx'
  mode '0660'
  variables :database => node[:database]
end

link "#{node[:deployed_to_path]}/current/config/database.yml" do
  owner 'deploy'
  group 'nginx'
  to "#{node[:deployed_to_path]}/shared/config/database.yml"
end
