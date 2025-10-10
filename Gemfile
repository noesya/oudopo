source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.7"

gem "activestorage-scaleway-service"
gem "breadcrumbs_on_rails"
gem "bootsnap", require: false
gem "bootstrap5-kaminari-views"
gem "bugsnag"
gem "cancancan"
gem "delayed_job_active_record"
gem "delayed_job_web"
gem "devise"
gem "devise-i18n"
gem "devise-bootstrap5"
gem "figaro"
gem "httparty"
gem "image_processing", "~> 1.2"
gem "jbuilder"
gem "jquery-rails"
gem "kaminari"
gem "kaminari-i18n"
gem "ostruct", "~> 0.6.0"
gem "pg", "~> 1.1"
gem "puma", "~> 7.0"
gem "rails", "~> 8.0"
gem "rails-i18n"
gem "redis", "~> 4.0"
gem "sassc-rails"
gem "simple_form"
gem "simple-navigation"
gem "sprockets-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "byebug", platforms: %i[ mri windows ]
end

group :development do
  gem "annotaterb"
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
