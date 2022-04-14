# == Schema Information
#
# Table name: health_professionals
#
#  id         :bigint           not null, primary key
#  entity_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class HealthProfessional < ApplicationRecord
  belongs_to :entity
  has_many :medical_cares
  has_many :patients, through: :medical_cares
end
