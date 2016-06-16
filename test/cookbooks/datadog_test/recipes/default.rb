# Convergence handler
node.default['save_convergence_handler']['cookbookfilters'] = [/.*/]
node.default['save_convergence_handler']['recipefilters'] = [/.*/]
include_recipe 'save_convergence_handler'

# datadog basics
node.default['datadog']['api_key'] = 'somethingnotnil'
node.default['datadog']['application_key'] = 'alsonotnil'
include_recipe 'datadog::dd-agent'

# Now setup the datadog monitor.
# This is verbose.

# Install the monitor
template 'datadog_chef_convergence.py' do
  path '/etc/dd-agent/checks.d/chef_convergence.py'
  source 'datadog_chef_convergence.py.erb'
  cookbook 'save_convergence_handler'
  owner 'dd-agent'
  group 'root'
  mode '0755'
end

handler_instance = {
  'file' => node['save_convergence_handler']['outfile'],
  # 'full_prefix' => nil,
  # 'recipe_prefix' => nil,
  'recipe_filters' => ['^chef_handler', '^save_convergence_handler'],
}

datadog_monitor 'chef_convergence' do
  cookbook 'save_convergence_handler'
  instances [handler_instance]
end
