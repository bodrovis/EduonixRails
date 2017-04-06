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
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

require 'rails_helper'

RSpec.describe User do
  subject {create(:user)}

  context 'validations' do
    it 'should be valid with a name and e-mail' do
      expect(subject).to be_valid
    end

    it "should not be valid without a name" do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it "should not be valid without a email" do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it "should not be valid with a duplicating e-mail" do
      user2 = build(:user, email: subject.email)
      expect(user2).not_to be_valid
    end
  end

  context 'events' do
    let(:event) {create(:event)}

    it "should return an array with proper values" do
      subject.events << event
      expect(subject.events).to include(event)
      expect(subject.events.length).to eq(1)
    end
  end
end
