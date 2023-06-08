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

  validates_presence_of :original_id

  before_validation :denormalize_data
  after_save, :extract_media
  
  scope :ordered, -> { order(date: :desc) }


  def to_s
    "#{name}"
  end

  protected

  def denormalize_data
    self.name = CGI.unescapeHTML data['essentials']['title']
    self.date = data['essentials']['date']
  end

  def extract_media

  end
end
