require 'rails_helper'

RSpec.describe Like, type: :model do
  user1 = User.new(name: 'Chris', photo: 'https://picsum.photos/200/300', bio: 'I am Burak', postscounter: 4)
  post1 = Post.new(author: user1, title: 'PostTitle1', text: ' Post text 1', commentscounter: 6,
                   likescounter: 5)

  like1 = Like.new(author: user1, post: post1)

  it 'check like1s user name is Burak' do
    expect(like1.author.name).to eq('Chris')
  end

  it 'check like1s posts title is PostTitle1' do
    expect(like1.post.title).to eq('PostTitle1')
  end

  it ' check likes_counter increment' do
    post1.likescounter = 0
    post1.save

    like1 = Like.new(author: user1, post: post1)
    like1.updatelikescounter

    expect(post1.likescounter).to eq(1)
  end
end
