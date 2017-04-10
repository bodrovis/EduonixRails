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
#  owner_id    :integer
#
# Indexes
#
#  index_events_on_category_id  (category_id)
#  index_events_on_owner_id     (owner_id)
#

class Event < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User'

  has_many :enrollments
  has_many :users, through: :enrollments

  validates :title, presence: true, length: {minimum: 2}, uniqueness: {scope: :category}
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :ends_at_greater_than_starts_at

  def participant?(user)
    self.users.include? user
  end

  private

  def ends_at_greater_than_starts_at
    if self.starts_at.present? && self.ends_at.present? && self.starts_at > self.ends_at
      self.errors.add(:starts_at, 'should be earlier than the ending time')
      self.errors.add(:ends_at, 'should be later than the starting time')
    end
  end
end
