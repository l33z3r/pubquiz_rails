# == Schema Information
#
# Table name: currencies
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  iso_code            :string(255)
#  leading_symbol      :string(255)
#  trailing_symbol     :string(255)
#  thousands_separator :string(255)
#  decimal_separator   :string(255)
#  sorting_order       :integer
#  active              :boolean
#  created_at          :datetime
#  updated_at          :datetime
#

require 'spec_helper'

describe Currency do

  # Constants
  #it { Currency.const_defined?(:CONSTANT_NAME) }

  # relationships
  it { should have_many(:countries) }

  # validation
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should validate_presence_of(:iso_code) }
  it { should validate_uniqueness_of(:iso_code) }

  it { should validate_presence_of(:leading_symbol) }

  it { should validate_presence_of(:trailing_symbol) }

  it { should validate_presence_of(:thousands_separator) }

  it { should validate_presence_of(:decimal_separator) }

  it { should validate_presence_of(:sorting_order) }
  it { should validate_numericality_of(:sorting_order) }

  # callbacks
  it { should callback(:check_dependencies).before(:destroy) }

  # scopes
  it { Currency.should respond_to(:all_in_order) }

  # class methods
  
  # instance methods
  it { should respond_to(:destroyable?) }
  
  skip "add some examples to (or delete) #{__FILE__}"

end
