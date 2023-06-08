# == Schema Information
#
# Table name: archives
#
#  id              :uuid             not null, primary key
#  description     :text
#  name            :string
#  secret          :string
#  slug            :string
#  url             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organisation_id :uuid             not null, indexed
#
# Indexes
#
#  index_archives_on_organisation_id  (organisation_id)
#
# Foreign Keys
#
#  fk_rails_71b4056303  (organisation_id => organisations.id)
#
class Archive < ApplicationRecord
  include WithSlug

  belongs_to :organisation
  before_validation :generate_secret_if_empty

  has_many :items

  validates_presence_of :original_id

  def store(data)
    original_id = data['essentials']['id']
    item = items.where(original_id: original_id).first_or_initialize
    item.data = data
    item.save
  end

  def to_s
    "#{name}"
  end

  protected

  def generate_secret_if_empty
    self.secret =  SecureRandom.uuid if secret.blank?
  end
end
