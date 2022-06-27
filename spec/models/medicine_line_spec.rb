# == Schema Information
#
# Table name: medicine_lines
#
#  id                :bigint           not null, primary key
#  medicine_id       :bigint           not null
#  medical_record_id :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'rails_helper'

RSpec.describe MedicineLine, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
