class Archive < ApplicationRecord
  belongs_to :organisation

  def to_s
    "#{name}"
  end
end
