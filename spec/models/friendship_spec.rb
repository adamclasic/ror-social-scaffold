require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) { User.create(name: 'Jane', email: 'jane@example.com', password: 'password1') }
  let(:friend) { User.create(name: 'John', email: 'john@example.com', password: 'password2') }
  let(:friendship) { Friendship.create(user_id: user.id, friend_id: friend.id) }

  context 'validations' do
    it 'expects friendship to be valid' do
      expect(friendship).to be_valid
    end
  end

  context 'associations' do
    it 'should belong to a user' do
      t = Friendship.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'should belong to a friend' do
      t = Friendship.reflect_on_association(:friend)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
