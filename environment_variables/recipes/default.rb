Chef::Log.info("foooooooooooooooooooooo")
Chef::Log.info(">>>>> #{node[:deployed_to_path]} <<<<<")
Chef::Log.info(">>>>> #{node[:environment_variables]} <<<<<")
# Chef::Log.info(">>>>> #{node[:custom_env][application]} <<<<<")
# node[:custom_env][application]

# template '/home/chris/.env' do
template "#{node[:deployed_to_path]}/shared/config/.env" do
# template "/srv/www/#{node[:environment_variables].keys[0]}/shared/config/.env" do
  source 'env.erb'
  owner 'deploy'
  group 'nginx'
  mode '0660'
  variables :environment_variables => node[:environment_variables]
  # variables :environment_variables => node[:environment_variables][node[:environment_variables].keys[0]]

  # symlink_before_migrate '.env' => 'config/.env'
end

link "#{node[:deployed_to_path]}/current/.env" do
# link "/srv/www/#{node[:environment_variables].keys[0]}/current/.env" do
  owner 'deploy'
  group 'nginx'
  to "#{node[:deployed_to_path]}/shared/config/.env"
  # to "/srv/www/#{node[:environment_variables].keys[0]}/shared/config/.env"
end

# symlink_before_migrate  "config/database.yml" => "config/database.yml"
