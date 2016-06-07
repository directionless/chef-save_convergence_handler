# Record all cookbook data, but only record recipes in cookbooks that
# start with "convergence"
node.default['convergence_handler']['cookbookfilters'] = [/.*/]
node.default['convergence_handler']['recipefilters'] = [/^convergence/]

# Setup the handler
include_recipe 'convergence_handler'
