# == Schema Information
#
# Table name: venues
#
#  id                :integer          not null, primary key
#  public_title      :string(255)
#  address           :text
#  latitude          :float(24)
#  longitude         :float(24)
#  created_by        :integer
#  updated_by        :integer
#  publicly_visible  :boolean
#  approved_by       :integer
#  time_zone         :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

require 'spec_helper'

describe Venue do

  # Constants
  #it { Venue.const_defined?(:CONSTANT_NAME) }

  # relationships
  it { should belong_to(:approver) }
  it { should belong_to(:creator) }
  it { should belong_to(:updater) }
  it { should have_many(:quiz_events) }

  # validation
  it { should validate_presence_of(:public_title) }

  it { should validate_presence_of(:address) }

  it { should_not validate_presence_of(:latitude) }
  it { should validate_numericality_of(:latitude) }

  it { should_not validate_presence_of(:longitude) }
  it { should validate_numericality_of(:longitude) }

  it { should validate_presence_of(:created_by) }
  it { should validate_numericality_of(:created_by) }

  it { should_not validate_presence_of(:updated_by) }
  it { should validate_numericality_of(:updated_by) }

  it { should_not validate_presence_of(:approved_by) }
  it { should validate_numericality_of(:approved_by) }

  it { should validate_presence_of(:time_zone) }

  # callbacks
  it { should callback(:check_dependencies).before(:destroy) }

  # scopes
  it { Venue.should respond_to(:all_in_order) }
  it { Venue.should respond_to(:find_near_to) }
  it { Venue.should respond_to(:visible_to_user) }

  # class methods

  
  # instance methods
  it { should respond_to(:destroyable?) }
  
  skip "add some examples to (or delete) #{__FILE__}"

end
