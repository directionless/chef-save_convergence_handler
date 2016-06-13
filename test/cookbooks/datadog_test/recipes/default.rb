# Convergence handler
node.default['convergence_handler']['cookbookfilters'] = [/.*/]
node.default['convergence_handler']['recipefilters'] = [/.*/]
include_recipe 'convergence_handler'

# datadog basics
node.default['datadog']['api_key'] = 'somethingnotnil'
node.default['datadog']['application_key'] = 'alsonotnil'
include_recipe 'datadog::dd-agent'

# Now setup the datadog monitor.
# This is verbose.

# Now setup the monitor
template 'datadog_chef_convergence.py' do
  path ::File.join(node['datadog']['config_dir'], 'checks.d', 'chef_convergence.py')
  source 'datadog_chef_convergence.py.erb'
  cookbook 'convergence_handler'
  owner 'dd-agent'
  group 'root'
  mode '0755'
end


handler_instance = {
  'file' => node['convergence_handler']['outfile'],
  #'full_prefix' => nil,
  #'recipe_prefix' => nil,
  'recipe_filters' => ['^chef_handler', '^convergence_handler']
}

datadog_monitor 'chef_convergence' do
  cookbook 'convergence_handler'
  instances [handler_instance]
end
