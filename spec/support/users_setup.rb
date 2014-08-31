require 'spec_helper'

shared_context 'users setup' do

  # users
  let!(:normal_user)            { FactoryGirl.create(:user) }
  let!(:admin_user)             { FactoryGirl.create(:admin_user) }

  # countries
  # todo let!(:country)                { FactoryGirl.create(:ireland) }
end
