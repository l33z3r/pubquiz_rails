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

class Currency < ActiveRecord::Base

  # Constants

  # relationships
  has_many :countries

  # validation
  validates :name, presence: true, uniqueness: true
  validates :iso_code, presence: true, uniqueness: true
  validates :leading_symbol, presence: true
  validates :trailing_symbol, presence: true
  validates :thousands_separator, presence: true
  validates :decimal_separator, presence: true
  validates :sorting_order, presence: true,
            numericality: {only_integer: true, greater_than: 0}

  # callbacks
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:sorting_order) }
  default_scope{all_in_order}

  # class methods

  # instance methods
  def destroyable?
    self.countries.empty?
  end

  protected

  def check_dependencies
    unless self.destroyable?
      errors.add(:base, "Couldn't be deleted because dependencies exist")
      false
    end
  end

end
