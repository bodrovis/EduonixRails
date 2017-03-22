# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  starts_at   :datetime
#  ends_at     :datetime
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_events_on_category_id  (category_id)
#

class Event < ApplicationRecord
  belongs_to :category
end
