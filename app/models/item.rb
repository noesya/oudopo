# == Schema Information
#
# Table name: items
#
#  id          :uuid             not null, primary key
#  data        :jsonb
#  date        :date
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  archive_id  :uuid             not null, indexed
#  original_id :string
#
# Indexes
#
#  index_items_on_archive_id  (archive_id)
#
# Foreign Keys
#
#  fk_rails_b9e5d687ad  (archive_id => archives.id)
#
class Item < ApplicationRecord
  belongs_to :archive
  has_and_belongs_to_many :assets

  validates_presence_of :original_id

  before_validation :denormalize_data
  after_save :extract_assets
  
  scope :ordered, -> { order(date: :desc) }


  def to_s
    "#{name}"
  end

  protected

  def denormalize_data
    self.name = CGI.unescapeHTML data['essentials']['title']
    self.date = data['essentials']['date']
  end

  def extract_assets
    data['media']['data'].each do |media|
      original_id = media.first
      asset = archive.assets.where(original_id: original_id).first_or_initialize
      asset.data = media.last
      asset.save
      assets << asset unless assets.include?(asset)
    end
  end
end
