# == Schema Information
#
# Table name: entities
#
#  id         :bigint           not null, primary key
#  name       :string
#  tax_number :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address    :string
#
class Entity < ApplicationRecord
  has_many :reviews
  has_one :health_professional
  has_one :patient
end
