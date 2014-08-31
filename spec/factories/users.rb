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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
   provider         'facebook'
   uid              '1015268094597830x'
   name             'Jox Sixpack'
   email            'john@example.com'
   image            'logo.gif'
   oauth_token      'CAAE0gL7g7P0BADPslEEkL3pFHwbvrGX5YBSOrDh7A5dyEiQfY...'
   oauth_expires_at { Time.now + 1.month }
  end

  factory :admin_user, class: User do
    provider         'facebook'
    uid              '10152680945978307'
    name             'Dan Laffan'
    email            'dan.laffan@mac.com'
    image            'logo.gif'
    oauth_token      'CAAE0gL7g7P0BADPslEEkL3pFHwbvrGX5YBSOrDh7A5dyEiQfY...'
    oauth_expires_at { Time.now + 1.month }
  end

end
