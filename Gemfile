source 'https://rubygems.org'

ruby '2.1.2'
gem 'rails', '4.1.5'

# Gems for all environments:
gem 'coffee-rails', '~> 4.0.1' # Use CoffeeScript for .js.coffee assets and views
gem 'geocoder'
gem 'haml-rails'  # a replacement system for HTML
gem 'hashie'
gem 'intercom-rails'
gem 'jbuilder', '~> 2.1.3' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'omniauth-facebook', '1.4.0'
gem 'sass-rails', '~> 4.0.3' # Use SCSS for stylesheets
gem 'turbolinks' # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'uglifier', '2.5.3' # Use Uglifier as compressor for JavaScript assets
gem 'will_paginate' # manage long web pages
gem 'will_paginate-bootstrap' # adds Bootstrap3 support to will_paginate

# Environment-specific gems:
group :development do

end

group :test do

end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'mysql2'
  gem 'rspec-rails', '~> 2.99'
  gem 'shoulda-callback-matchers'
  gem 'shoulda-matchers'
end

group :staging do

end

group :production do

end

group :staging, :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
