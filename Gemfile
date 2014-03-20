#----------------------------------------------
# gem sources
#----------------------------------------------

source "http://rubygems.org"

ruby '2.0.0'

#----------------------------------------------
# common gems
#----------------------------------------------

# rails, etc.
gem 'rails',              '4.0.2'
gem 'coffee-rails',       '~> 4.0.0'
gem 'sass-rails',         '~> 4.0.0'
gem 'uglifier',           '>= 1.3.0'


# authentication/authorization


# servers/drivers
gem 'pg',                 '~> 0.17.1'
gem 'puma',               '~> 2.8.1'

# view gems
gem 'bootstrap-sass',             '~> 3.1.0.2'
gem 'haml-rails',                 '~> 0.5.3'
gem 'jbuilder',                   '~> 2.0.2'
gem 'jquery-rails',               '~> 2.1.4'


# other gems
#gem 'kaminari',                       '~> 0.15.1'
gem 'gmaps4rails',                '~> 2.1.2'
gem 'rspec-nc'


#----------------------------------------------
# environments
#----------------------------------------------

# local
group :development, :test do
  gem 'annotate',             '~> 2.6.0'
  gem 'brakeman',             '~> 2.3.1', require: false
  gem 'database_cleaner',     '~> 1.2.0'
  gem 'factory_girl_rails',   '~> 4.4.1'
  gem 'pry-rails',            '~> 0.3.2'
  gem 'rspec-rails',          '~> 2.14.1'
  gem 'capybara',             '~> 2.2.1'
end

# remote
group :production do
  gem 'rails_12factor',       '~> 0.0.2'
end
