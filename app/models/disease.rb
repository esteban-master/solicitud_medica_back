# == Schema Information
#
# Table name: diseases
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Disease < ApplicationRecord
end
