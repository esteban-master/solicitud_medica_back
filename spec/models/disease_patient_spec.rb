# == Schema Information
#
# Table name: disease_patients
#
#  id         :bigint           not null, primary key
#  patient_id :bigint           not null
#  disease_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe DiseasePatient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
