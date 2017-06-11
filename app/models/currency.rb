# == Schema Information
#
# Table name: currencies
#
#  id         :integer          not null, primary key
#  title      :string
#  symbol     :string
#  rate       :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Currency < ApplicationRecord
end
