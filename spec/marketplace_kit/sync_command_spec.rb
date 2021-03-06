describe 'sync command' do
  subject { execute_command('sync') }

  before(:each) do
    stub_request(:put, 'http://localhost:3000/api/marketplace_builder/marketplace_releases/sync').to_return(status: 200, body: {}.to_json)
  end

  it 'displays ready message' do
    expect { subject }.to output(/Sync mode enabled/).to_stdout
  end

  it 'sleeps till user exit' do
    expect_any_instance_of(Object).to receive(:sleep).and_return(nil)
    subject
  end

  it 'sends API call with modified file' do
    allow(@fake_listener).to receive(:start) do
      @fake_listener.on_file_changed.call ["#{MarketplaceKit.root}/marketplace_builder/liquid_views/index.liquid"], [], []
    end

    subject

    expect(a_request(:put, 'http://localhost:3000/api/marketplace_builder/marketplace_releases/sync')).to have_been_made
  end

  it 'sends API call with modified binary file' do
    allow(@fake_listener).to receive(:start) do
      @fake_listener.on_file_changed.call ["#{MarketplaceKit.root}/marketplace_builder/custom_themes/default_custom_theme/example.png"], [], []
    end

    subject

    expect(a_request(:put, 'http://localhost:3000/api/marketplace_builder/marketplace_releases/sync')).to have_been_made
  end
end
