# == Schema Information
#
# Table name: teams
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  quiz_event_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Team do

  # Constants
  #it { Team.const_defined?(:CONSTANT_NAME) }

  # relationships
  it { should belong_to(:quiz_event) }
  it { should have_many(:event_team_members) }

  # validation
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:quiz_event_id) }
  it { should validate_numericality_of(:quiz_event_id) }

  # callbacks
  it { should callback(:check_dependencies).before(:destroy) }

  # scopes
  it { Team.should respond_to(:all_in_order) }

  # class methods
  
  # instance methods
  it { should respond_to(:destroyable?) }
  
end
