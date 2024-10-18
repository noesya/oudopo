require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Oudopo
  class Application < Rails::Application
    config.load_defaults 7.2

    config.autoload_lib(ignore: %w[assets tasks])

    config.internal_domains = ['@noesya.coop'].freeze
    config.time_zone = 'Europe/Paris'

    config.sass.preferred_syntax = :sass

    config.i18n.available_locales = [:fr]
    config.i18n.default_locale = :fr

    config.active_storage.variant_processor = :mini_magick

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end
