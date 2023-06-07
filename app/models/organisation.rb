# == Schema Information
#
# Table name: organisations
#
#  id         :uuid             not null, primary key
#  name       :string
#  slug       :string
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Organisation < ApplicationRecord
  include WithSlug

  has_many :archives

  def to_s
    "#{name}"
  end
end
