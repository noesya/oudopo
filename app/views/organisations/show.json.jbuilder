json.extract! @organisation, :id, :name, :website, :created_at, :updated_at
json.archives @organisation.archives.each do |archive|
  json.id archive.id
  json.name archive.name
  json.items archive.items.count
  json.url direct_archive_url(  organisation_slug: @organisation.slug,
                                archive_slug: archive.slug,
                                format: :json)
end
