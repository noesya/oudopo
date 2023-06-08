# == Schema Information
#
# Table name: assets
#
#  id           :uuid             not null, primary key
#  data         :jsonb
#  date         :datetime
#  original_url :text
#  path         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  archive_id   :uuid             not null, indexed
#  original_id  :string
#
# Indexes
#
#  index_assets_on_archive_id  (archive_id)
#
# Foreign Keys
#
#  fk_rails_c98d5b8c4c  (archive_id => archives.id)
#
class Asset < ApplicationRecord
  belongs_to :archive
  has_and_belongs_to_many :items

  validates_presence_of :original_id

  before_validation :manage_file

  scope :ordered, -> { order(date: :desc) }

  def url
    "#{ENV['SCALEWAY_OS_URL']}#{path}"
  end

  def suffix
    original_url.split('.').last
  end

  def filename
    original_url.split('/').last
  end

  protected

  def manage_file
    self.date = data['post_date_gmt']
    self.original_url = data['guid']
    self.path = composed_path
    upload
  end

  def composed_path
    "#{archive.organisation.slug}/#{archive.slug}/assets/#{original_id}.#{suffix}"
  end
  
  def upload
    # dir = Rails.root.join('tmp', 'files', id)
    # FileUtils.mkpath dir
    # file = "#{dir}/file.#{suffix}"
    # File.open(file, "wb") do |f| 
    #   f.write HTTParty.get(url).body
    # end
    body = HTTParty.get(original_url).body
    ActiveStorage::Blob.service.upload(path, body)
  end
end
