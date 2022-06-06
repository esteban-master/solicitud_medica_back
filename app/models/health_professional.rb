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
class HealthProfessional < ApplicationRecord
  belongs_to :entity
  belongs_to :profession
  has_many :medical_cares
  has_many :patients, through: :medical_cares
end
