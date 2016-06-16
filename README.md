# Chef Save Convergence Handler

A simple chef handler, that will save the last convergence time to disk.

Designed to help monitoring systems that read data persisted to disk.

## Usage

Set attributes and `include_recipe 'save_convergence_handler'`

Attributes may be seen in [attributes/default.rb]

A complete example can be seen in the [integration tests](test/cookbooks/save_convergence_handler_test/recipes/filters.rb)

## Testing

I don't know how to test handlers with chefspec, so testing is
primarily done through test kitchen.

## Related Projects

There are lots of chef handlers out there. These are some that felt
related, but not quite appropriate.

* https://github.com/chrisgit/chef-summary_handlers
* https://github.com/juliandunn/cookbook_versions_handler

# Monitoring Systems

## DataDog

This cookbook includes a datadog custom check. You'll need to
configure and install it. For an example, look at the [integration tests](test/cookbooks/datadog_test/recipes/default.rb)
