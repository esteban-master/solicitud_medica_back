# == Schema Information
#
# Table name: patients
#
#  id         :bigint           not null, primary key
#  entity_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
