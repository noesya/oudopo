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
require "test_helper"

class ArchiveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
