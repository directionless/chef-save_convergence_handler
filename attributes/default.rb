# where do we write data?
default['convergence_handler']['outfile'] = '/var/tmp/convergence.json'

# what recipes or cookbooks should we save info for?  these are arrays
# of regexps, to be combined with Regexp.union. Set them to /.*/ if
# you want everything. Set to nothing if you want nothing.
default['convergence_handler']['cookbookfilters'] = []
default['convergence_handler']['recipefilters'] = []
