# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  provider         :string(255)
#  uid              :string(255)
#  name             :string(255)
#  email            :string(255)
#  image            :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe User do

  # Constants
  it { Team.const_defined?(:OAUTH_PLATFORMS) }

  # relationships
  it { should have_many(:event_team_members) }
  it { should have_many(:quiz_events) }
  it { should have_many(:quiz_rounds_created) }
  it { should have_many(:quiz_rounds_updated) }

  # validations

  # callbacks

  # scopes

  # instance methods
  it { should respond_to(:admin?) }
  it { should respond_to(:event_team_member_id) }

  # class methods
  it { User.should respond_to(:from_omniauth) }

end