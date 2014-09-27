# == Schema Information
#
# Table name: event_team_members
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  team_id         :integer
#  referral_from   :string(255)
#  device_platform :string(255)
#  device_type     :string(255)
#  tablet          :boolean
#  phone           :boolean
#  pc              :boolean
#  app_version_id  :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe EventTeamMember do

  # Constants
  #it { EventTeamMember.const_defined?(:CONSTANT_NAME) }

  # relationships
  xit { should belong_to(:app_version) }
  it { should have_many(:submitted_answers) }
  it { should belong_to(:team) }
  it { should belong_to(:user) }

  # validation
  it { should validate_presence_of(:user_id) }
  it { should validate_numericality_of(:user_id) }

  it { should validate_presence_of(:team_id) }
  it { should validate_numericality_of(:team_id) }

  xit { should validate_presence_of(:app_version_id) }
  xit { should validate_numericality_of(:app_version_id) }

  # callbacks
  it { should callback(:create_submitted_answers).after(:create) }
  it { should callback(:update_submitted_answers).after(:update) }
  it { should callback(:check_dependencies).before(:destroy) }

  # scopes
  it { EventTeamMember.should respond_to(:all_in_order) }

  # class methods
  
  # instance methods
  it { should respond_to(:destroyable?) }
  it { should respond_to(:quiz_event_id) }

end
