require 'rails_helper'

RSpec.describe Comment, type: :model do
  user1 = User.new(name: 'Burak', photo: 'https://picsum.photos/200/300', bio: 'I am Burak', postscounter: 4)
  post1 = Post.new(author: user1, title: 'PostTitle1', text: ' Post text 1', commentscounter: 6,
                   likescounter: 5)

  comment1 = Comment.new(author: user1, post: post1, text: 'texting')
  it 'check comment1s text is equal "texting"' do
    expect(comment1.text).to eq('texting')
  end

  it ' check comment1s author name is Burak' do
    expect(comment1.author.name).to eq('Burak')
  end

  it 'check comment1s post title "PostTitle1" is true' do
    expect(comment1.post.title == 'PostTitle1').to eq(true)
  end

  it 'check post comments_counter is increasing' do
    post1.commentscounter = 0
    post1.save

    comment1 = Comment.new(author: user1, post: post1, text: 'texting')

    comment1.updatecommentscounter
    comment1.updatecommentscounter

    expect(post1.commentscounter).to eq(2)
  end
end
