# == Schema Information
#
# Table name: countries
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  in_the_eu     :boolean
#  currency_id   :integer
#  sorting_order :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Country do

  # Constants
  #it { Country.const_defined?(:CONSTANT_NAME) }

  # relationships
  it { should belong_to(:currency) }

  # validation
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should validate_presence_of(:currency_id) }
  it { should validate_numericality_of(:currency_id) }

  it { should validate_presence_of(:sorting_order) }
  it { should validate_numericality_of(:sorting_order) }

  # callbacks
  it { should callback(:check_dependencies).before(:destroy) }

  # scopes
  it { Country.should respond_to(:all_in_order) }

  # class methods
  
  # instance methods
  it { should respond_to(:destroyable?) }

end
