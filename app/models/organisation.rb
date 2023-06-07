class Organisation < ApplicationRecord
  has_many :archives

  def to_s
    "#{name}"
  end
end
