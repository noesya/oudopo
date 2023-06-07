require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Oudopo
  class Application < Rails::Application
    config.load_defaults 7.0

    config.sass.preferred_syntax = :sass

    config.i18n.available_locales = [:fr]
    config.i18n.default_locale = :fr

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end
