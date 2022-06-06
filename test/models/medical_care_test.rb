# == Schema Information
#
# Table name: medical_cares
#
#  id                     :bigint           not null, primary key
#  patient_id             :bigint           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  health_professional_id :bigint           not null
#  attended               :boolean
#  date                   :datetime
#
require "test_helper"

class MedicalCareTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
