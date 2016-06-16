source 'https://supermarket.chef.io'

def test_cookbook(name)
  location = "./test/cookbooks/#{name}"
  cookbook name, path: location
end

metadata

group :test do
  test_cookbook 'save_convergence_handler_test'
  test_cookbook 'datadog_test'
end
