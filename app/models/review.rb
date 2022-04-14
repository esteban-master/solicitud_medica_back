# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  entity_id   :bigint           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Review < ApplicationRecord
  belongs_to :entity
end
