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
require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
