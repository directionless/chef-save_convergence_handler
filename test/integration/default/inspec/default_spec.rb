# Test that the various recipes were included, by way of temp files.
describe file('/tmp/save_convergence_handler_test1') do
  it { should be_file }
end

# Test data in the handler's output Since we're comparing timestamps,
# let's say it needs to have finished in the last 30s
end_time = Time.now.to_i
start_time = end_time - 30
json_obj = json('/var/tmp/convergence.json')
describe json_obj do
  it 'full convergence timestamp' do
    expect(json_obj['full_convergence']).to be >= start_time
    expect(json_obj['full_convergence']).to be <= end_time
  end

  it 'cookbooks recorded' do
    expect(json_obj['cookbooks'].keys).to eq([])
  end

  it 'recipes recorded' do
    expect(json_obj['recipes'].keys).to eq([])
  end
end
