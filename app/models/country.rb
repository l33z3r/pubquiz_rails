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

class Country < ActiveRecord::Base

  # Constants

  # relationships
  belongs_to :currency
  has_many :question_categories

  # validation
  validates :name, presence: true, uniqueness: true
  validates :currency_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :sorting_order, presence: true,
            numericality: {only_integer: true, greater_than: 0}

  # callbacks
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:sorting_order, :name) }

  # class methods

  # instance methods
  def destroyable?
    self.question_categories.empty?
  end

  protected

  def check_dependencies
    unless self.destroyable?
      errors.add(:base, "Couldn't be deleted because dependencies exist")
      false
    end
  end

end
