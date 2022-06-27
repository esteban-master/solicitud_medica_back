# == Schema Information
#
# Table name: medicines
#
#  id         :bigint           not null, primary key
#  name       :string
#  dose       :string
#  management :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Medicine, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
