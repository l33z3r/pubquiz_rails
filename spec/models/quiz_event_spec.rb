require 'spec_helper'

describe QuizEvent do

  # Constants
  #it { QuizEvent.const_defined?(:CONSTANT_NAME) }

  # relationships
  it { should belong_to(:creator) }
  it { should belong_to(:updater) }
  xit { should belong_to(:venue) }

  # validation
  it { should validate_presence_of(:name) }

  #it { should validate_presence_of(:description) }

  it { should validate_presence_of(:time_zone) }

  it { should validate_presence_of(:starts_at) }

  it { should validate_presence_of(:venue_id) }
  it { should validate_numericality_of(:venue_id) }

  it { should validate_presence_of(:created_by) }
  it { should validate_numericality_of(:created_by) }

  it { should_not validate_presence_of(:updated_by) }
  it { should validate_numericality_of(:updated_by) }

  # callbacks
  it { should callback(:generate_event_guid).before(:validation).on(:create) }
  it { should callback(:check_dependencies).before(:destroy) }

  # scopes
  it { QuizEvent.should respond_to(:all_in_order) }

  # class methods
  
  # instance methods
  it { should respond_to(:destroyable?) }
  
end
