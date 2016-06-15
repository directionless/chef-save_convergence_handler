# Record all cookbook data, but only record recipes in cookbooks that
# start with "convergence"
node.default['save_convergence_handler']['cookbookfilters'] = [/.*/]
node.default['save_convergence_handler']['recipefilters'] = [/^save_convergence/]

# Setup the handler
include_recipe 'save_convergence_handler'
