# == Schema Information
#
# Table name: patients
#
#  id         :bigint           not null, primary key
#  entity_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Patient < ApplicationRecord
  belongs_to :entity
  has_many :medical_cares
  has_many :health_professionals, through: :medical_cares
end
