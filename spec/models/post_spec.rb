require 'rails_helper'

RSpec.describe Post, type: :model do
  user1 = User.new(name: 'Chris', photo: 'https://picsum.photos/200/300', bio: 'I am Chris', postscounter: 4)
  post1 = Post.new(author: user1, title: 'PostTitle1', text: ' Post text 1', commentscounter: 6, likescounter: 5)

  it 'check post1 title presence validation' do
    post1.title = ''
    expect(post1).to_not be_valid
  end

  it 'check post1s title length higher than 250 validation' do
    post1.title = 'qwe' * 100
    expect(post1).to_not be_valid
  end

  it 'check post1s comments_counter only_integer validation' do
    post1.commentscounter = 'qwe'
    expect(post1).to_not be_valid
  end

  it 'check post1s comments_counter greater_than_or_equal_to: 0 validation' do
    post1.commentscounter = -2
    expect(post1).to_not be_valid
  end

  it 'check post1s likes_counter only_integer validation' do
    post1.likescounter = 'qwe'
    expect(post1).to_not be_valid
  end

  it 'check post1s likes_counter greater_than_or_equal_to: 0 validation' do
    post1.likescounter = -2
    expect(post1).to_not be_valid
  end

  it 'check post1s update_post_counter incrementation' do
    user1.postscounter = 0
    user1.save

    post = Post.create!(author: user1, title: 'title', text: ' Post text 1', commentscounter: 0, likescounter: 0)

    post.updatepostscounter
    post.updatepostscounter

    expect(user1.postscounter).to eq(3)
  end

  it 'check bring recent_five_comments' do
    user1 = User.new(name: 'Chris', photo: 'https://picsum.photos/200/300', bio: 'I am chruis', postscounter: 4)

    post1 = Post.new(author: user1, title: 'PostTitle1', text: ' Post text 1', commentscounter: 6,
                     likescounter: 5)
    @comment1 = Comment.create!(author: user1, post: post1, text: 'chrus')
    @comment2 = Comment.create!(author: user1, post: post1, text: 'chrus')
    @comment3 = Comment.create!(author: user1, post: post1, text: 'chrus')
    @comment4 = Comment.create!(author: user1, post: post1, text: 'chrus')
    @comment5 = Comment.create!(author: user1, post: post1, text: 'chrus')
    @comment6 = Comment.create!(author: user1, post: post1, text: 'chrus')

    expect(post1.recentfivecomments).to eq([@comment6, @comment5, @comment4, @comment3, @comment2])
  end
end
