# == Schema Information
#
# Table name: health_professionals
#
#  id             :bigint           not null, primary key
#  entity_id      :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  professions_id :bigint
#
require "test_helper"

class HealthProfessionalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
