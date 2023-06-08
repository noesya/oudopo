# == Schema Information
#
# Table name: assets
#
#  id           :uuid             not null, primary key
#  data         :jsonb
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
require "test_helper"

class AssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
