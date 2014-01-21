Chef::Log.info("foooooooooooooooooooooo")
Chef::Log.info(">>>>> #{node[:deployed_to_path]} <<<<<")
Chef::Log.info(">>>>> #{node[:packages]} <<<<<")

node[:packages].each do |package|
  package package do
    # version '1.16.1-1'
    action :install
  end
end
