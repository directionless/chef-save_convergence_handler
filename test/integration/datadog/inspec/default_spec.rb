# We can probably assume that things mostly worked, and we should just
# be checking the datadog functionality.

# did the check get installed?
describe file('/etc/dd-agent/checks.d/chef_convergence.py') do
  it { should be_file }
  it { should be_executable }
end

# We should run the datadog monitor, and check it's output. We use
# this to test that the filters behave as expected on the monitor.
# I'd love to parse these metrics more reasonable than this grotty
# stdout, but...
dd_check = command('sudo -u dd-agent dd-agent check chef_convergence')
describe dd_check do
  its('exit_status') { should eq 0 }
  it 'correct output' do
    expect(dd_check.stdout).not_to match(/chef.convergence.recipe.datadog/)
    expect(dd_check.stdout).to match(/chef.convergence.recipe.chef_handler/)
    expect(dd_check.stdout).to match(/chef.convergence.recipe.convergence_handler/)
  end
end
