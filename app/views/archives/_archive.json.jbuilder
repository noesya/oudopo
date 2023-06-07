json.extract! archive, :id, :organization_id, :secret, :url, :description, :created_at, :updated_at
json.url archive_url(archive, format: :json)
