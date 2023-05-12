require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  before { subject.save }

  context 'testing validation' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'photo should be present' do
      subject.photo = nil
      expect(subject).to_not be_valid
    end
    it 'bio should be present' do
      subject.bio = nil
      expect(subject).to_not be_valid
    end
    it 'should return a number' do
      expect(subject.postscounter).to_not eq 0
    end
  end

  context 'testing scopes' do
    it 'should return 3 examples' do
      expect(subject.recentthreeposts).to_not eq 0
    end
  end
end
