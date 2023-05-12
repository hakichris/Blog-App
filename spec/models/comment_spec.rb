require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(author_id: 3, post_id: 3)}
 
  context 'it should exist' do
 it 'should exist as instance' do
 expect(subject).to be_instance_of Comment
  end 
end
end
