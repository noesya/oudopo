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
require "test_helper"

class OrganisationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
