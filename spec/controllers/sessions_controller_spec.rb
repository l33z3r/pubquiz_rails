require 'spec_helper'

describe SessionsController, 'OmniAuth' do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
  end

  it 'sets a session variable to the OmniAuth auth hash' do
    request.env['omniauth.auth'][:uid].should == '12345'
  end

  it 'creates a user when a previously unknown user signs in with FB +oauth' do
    get 'create'
    request.env['omniauth.auth'][:uid].should == '12345'
    User.all.count.should == 1
  end
end