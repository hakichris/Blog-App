require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author_id: 3, post_id: 3) }

  context 'it should exist' do
    it 'should exist as instance' do
      expect(subject).to be_instance_of Like
    end
  end
end
