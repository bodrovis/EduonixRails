# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_enrollments_on_event_id              (event_id)
#  index_enrollments_on_user_id               (user_id)
#  index_enrollments_on_user_id_and_event_id  (user_id,event_id) UNIQUE
#

class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, uniqueness: {scope: :event}
end
