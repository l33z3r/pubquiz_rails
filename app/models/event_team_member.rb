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
#  quiz_event_id   :integer
#

class EventTeamMember < ActiveRecord::Base

  # Constants
  REFERRAL_SOURCES = %w(person, team, event)

  # relationships
  #belongs_to :app_version
  belongs_to :quiz_event, inverse_of: :event_team_members
  has_many :submitted_answers, inverse_of: :event_team_member
  belongs_to :team, inverse_of: :event_team_members
  belongs_to :user, inverse_of: :event_team_members

  # validation
  validates :user_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :team_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  #validates :referral_from, inclusion: {in: REFERRAL_SOURCES}
  #validates :device_platform, presence: true
  #validates :device_type, presence: true
  #validates :app_version_id, presence: true, numericality: {only_integer: true, greater_than: 0}

  # callbacks
  before_create :set_event_id
  after_create :create_submitted_answers
  after_update :update_submitted_answers
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:team_id, :user_id, :created_at) }
  default_scope{all_in_order}

  # class methods

  # instance methods
  def destroyable?
    self.submitted_answers.empty?
  end

  protected

  def check_dependencies
    unless self.destroyable?
      errors.add(:base, "Couldn't be deleted because dependencies exist")
      false
    end
  end

  def create_submitted_answers
    quiz_event = self.quiz_event

    quiz_event.quiz_rounds.each do |quiz_round|
      quiz_round_questions = quiz_round.quiz_round_questions

      quiz_round_questions.each do |question|
        SubmittedAnswer.create(
                event_team_member_id: self.id,
                user_id: self.user_id,
                team_id: self.team_id,
                quiz_event_id: self.team.quiz_event_id,
                quiz_round_question_id: question.id,
                question_answer_id: nil,
                correct: nil,
                points_scored: 0,
                question_asked_at: nil,
                question_answered_at: nil
        )
      end
    end
  end

  def set_event_id
    self.quiz_event_id = self.team.quiz_event_id
  end

  def update_submitted_answers
    self.submitted_answers.update_all(team_id: self.team_id)
  end

end
