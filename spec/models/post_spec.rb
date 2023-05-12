require 'rails_helper'

RSpec.describe Post, type: :model do
 subject {Post.new(author_id: 3, title: 'Hello', text: 'This is my first post')}
 before { subject.save }

 context 'when testing validation' do 
  it 'title should be present' do 
    subject.title = nil
    expect(subject).to_not be_valid
  end 

  it 'title should be present' do 
    subject.text = nil
    expect(subject).to_not be_valid
  end 
end 

context 'testing scopes' do
  it 'should return a number' do
  expect(subject.recentfivecomments).to_not eq 0
end 
end

end
