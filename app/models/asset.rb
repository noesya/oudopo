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
    original_url
  end

  protected

  def manage_file
    self.date = data['post_date_gmt']
    self.original_url = data['guid']
    # TODO create path and send to scaleway
  end
end
