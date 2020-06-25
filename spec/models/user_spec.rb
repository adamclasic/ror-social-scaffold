require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    subject do
      described_class.new(email:"jane@example.com", name: "Jane", password:"password")
    end

    it 'expects required attributes to be valid' do
      expect(subject).to be_valid
    end

    it 'expects user to not be valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'expects name to not be too long' do
      subject.name = "aa" * 20
      expect(subject).to_not be_valid
    end

    it 'expects user to not be valid without a valid email' do
      subject.email =" janeexamplecom"
      expect(subject).to_not be_valid
    end

     it 'expects password to not be too short' do
      subject.password ="aa"
      expect(subject).to_not be_valid
    end

  end

  context "associations" do
    it 'should have many posts' do
      t = User.reflect_on_association(:posts)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many comments' do
      t = User.reflect_on_association(:comments)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many likes' do
      t = User.reflect_on_association(:likes)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many friendships' do
      t = User.reflect_on_association(:friendships)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many inverse frienships' do
      t = User.reflect_on_association(:inverse_friendships)
      expect(t.macro).to eq(:has_many)
    end
  end
end
