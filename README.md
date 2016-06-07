# Chef Convergence Handler

A simple chef handler, that will note the last time recipes converged.

Designed to help monitoring systems that read data persisted to disk.

## Usage

Set attributes and `include_recipe 'convergence_handler'`

Attributes may be seen in [attributes/default.rb]

A complete example can be seen in [test/cookbooks/convergence_handler_test/recipes/filters.rb]

## Testing

I don't know how to test handlers with chefspec, so testing is
primarily done through test kitchen. There are two suites, `default`
and `filters`

## Related Projects

There are lots of chef handlers out there. These are some that felt
related, but not quite appropriate.

* https://github.com/chrisgit/chef-summary_handlers
* https://github.com/juliandunn/cookbook_versions_handler
