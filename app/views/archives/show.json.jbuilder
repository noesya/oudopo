json.extract! @archive, :id, :secret, :url, :description, :created_at, :updated_at
json.organisation do 
  json.id @organisation.id
  json.name @organisation.name
  json.url direct_organisation_url( organisation_slug: @organisation.slug,
                                    format: :json)
end
json.items @archive.items.ordered do |item|
  json.id item.id
  json.name item.name
  json.date item.date
  json.url direct_item_url( organisation_slug: @organisation.slug,
                            archive_slug: @archive.slug,
                            item_id: item.id, 
                            format: :json)
end