# == Schema Information
#
# Table name: quiz_events
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  description        :text
#  time_zone          :string(255)
#  starts_at          :datetime
#  venue_id           :integer
#  created_by         :integer
#  updated_by         :integer
#  event_guid         :string(255)
#  sponsor_logo_url   :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  logo_file_name     :string(255)
#  logo_content_type  :string(255)
#  logo_file_size     :integer
#  logo_updated_at    :datetime
#  open_to_the_public :boolean
#  event_status       :string(255)
#

require 'spec_helper'

describe QuizEvent do

  # Constants
  it { QuizEvent.const_defined?(:STATUSES) }

  # relationships
  it { should belong_to(:creator) }
  it { should have_many(:event_team_members) }
  it { should have_many(:quiz_rounds) }
  it { should have_many(:teams) }
  it { should belong_to(:updater) }
  it { should belong_to(:venue) }

  # validation
  it { should ensure_inclusion_of(:event_status).in_array(QuizEvent::STATUSES) }

  it { should validate_presence_of(:name) }

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
  it { should respond_to(:current?) }
  it { should respond_to(:destroyable?) }
  it { should respond_to(:in_dst) }
  it { should respond_to(:starts_at_epoch) }
  it { should respond_to(:time_zone_offset_minutes) }

end
