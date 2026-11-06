Rails.application.config.to_prepare do
  ActiveStorage::Engine.config.active_storage.content_types_to_serve_as_binary.delete('image/svg+xml')

  # Override ActiveStorage::Filename#sanitized to remove accents and all special chars
  # Base method: https://github.com/rails/rails/blob/v7.0.3/activestorage/app/models/active_storage/filename.rb#L57
  ActiveStorage::Filename.class_eval do
    def sanitized
      raw_extension = File.extname(@filename)
      raw_base = File.basename(@filename, raw_extension)
      base_filename = raw_base.encode(Encoding::UTF_8, invalid: :replace, undef: :replace, replace: "�")
                          .strip
                          .tr("\u{202E}%$|:;/\t\r\n\\", "-")
                          .parameterize(preserve_case: true)
      [base_filename, raw_extension].join('')
    end
  end
end
