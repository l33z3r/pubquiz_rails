# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  provider         :string(255)
#  uid              :string(255)
#  name             :string(255)
#  email            :string(255)
#  image            :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#  created_at       :datetime
#  updated_at       :datetime
#

class User < ActiveRecord::Base

  # Constants
  OAUTH_PLATFORMS = %w(facebook) # twitter)

  # relationships
  has_many :event_team_members
  has_many :quiz_events, class_name: 'QuizEvent', foreign_key: :created_by
  has_many :quiz_rounds_created, class_name: 'QuizRound', foreign_key: :created_by
  has_many :quiz_rounds_updated, class_name: 'QuizRound', foreign_key: :updated_by

  # validation

  # callbacks

  # instance_methods
  def admin?
    self.uid == '10152680945978307' || self.email == 'lee.farrell6@mail.dcu.ie'
  end

  def event_team_member_id
    self.event_team_members.last.try(:id)
  end

  # class methods

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth[:provider]
      user.email = auth[:info][:email]
      user.image = auth[:info][:image]
      user.uid = auth[:uid]
      user.name = auth[:info][:name]
      user.oauth_token = auth[:credentials][:token]

      #there is no expires field received from fb when using the mobile device
      if auth[:credentials][:expires_at]
        user.oauth_expires_at = Time.at(auth[:credentials][:expires_at])
      end

      user.save!
    end
  end
end
