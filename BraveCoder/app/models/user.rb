# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  admin           :boolean          default(FALSE)
#
# Indexes
#
#  index_users_on_admin  (admin)
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  has_many :owned_events, class_name: 'Event', foreign_key: :owner_id

  has_many :enrollments
  has_many :events, through: :enrollments

  validates :name, presence: true, length: {minimum: 2}
  validates :email, presence: true, uniqueness: true, email: true

  before_save :normalize_name, if: "name_changed?"
  before_create :normalize_email

  scope :admins, -> { where(admin: true) }

  has_secure_password

  def self.from_email_password(email, password)
    user = self.find_by(email: email.downcase)
    user && user.authenticate(password)
  end

  def enrolled_for?(event)
    self.events.include? event
  end

  private

  def normalize_name
    self.name.gsub! /[^\w\s]/, ''
  end
  
  def normalize_email
    self.email.downcase!
  end
end
