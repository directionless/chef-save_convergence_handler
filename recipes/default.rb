include_recipe 'chef_handler'

install_path = "#{node['chef_handler']['handler_path']}/save_convergence_handler.rb"

template install_path do
  source 'save_convergence_handler.rb.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

chef_handler 'Handler::SaveConvergence' do
  source install_path
  supports report: true
  action :enable
end
