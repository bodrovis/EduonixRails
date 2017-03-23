# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Category < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :title, presence: true, length: {minimum: 2}
end
