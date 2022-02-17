source 'https://rubygems.org'

ruby '3.0.3'
gem 'rails', '~> 6.0.4', '>= 6.0.4.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'rexml'
gem 'language_list'
gem 'country_select'
gem 'cancancan'
gem 'rails_admin'
gem 'carrierwave'
gem 'mini_magick'
gem 'kaminari'
gem 'ransack'
gem 'faker'
gem 'fog-aws'
gem 'dotenv-rails'
gem "figaro"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'
  gem 'annotate'
  gem 'rails-flog', require: 'flog'
  gem 'capistrano', '3.16.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'capistrano3-puma', '4.0'
  gem 'capistrano-rails-collection' # 例：　rails:rake:db:migrate　など
  gem 'capistrano-rails-console' # cap production rails:c でコンソールにアクセスしたい場合
  gem 'capistrano-rake' # 例：　cap production invoke:rake TASK=paperclip:refresh
  gem 'capistrano-sidekiq', '1.0.2' # sidekiqを使う場合
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
