require 'rails_helper'

RSpec.describe User, type: :model do
  user1 = User.new(name: 'chris', photo: 'https://picsum.photos/200/300', bio: 'I am chris', postscounter: 4)
  user2 = User.new(name: 'Ahmet', photo: 'https://picsum.photos/200/300', bio: 'I am Ahmet', postscounter: -2)
  user3 = User.new(name: '', photo: 'https://picsum.photos/200/300', bio: 'I am Ahmet', postscounter: 3)

  it 'check user1s name not be blank' do
    expect(user1.name).to_not eq('')
  end

  it 'check user1s photo is a string' do
    expect(user1.photo).to eq('https://picsum.photos/200/300')
  end

  it 'check user1s name shorter than 250 characters' do
    expect(user1.name.length < 250).to eq(true)
  end

  it 'check user1s posts_counter be integer' do
    expect(user1.postscounter >= 0).to eq(true)
  end

  it 'check user2s posts_counter lower than 0' do
    expect(user2).to_not be_valid
  end

  it 'check user3s name not be blank' do
    expect(user3).to_not be_valid
  end

  it 'need to bring users1s last three posts' do
    user1.save
    @post1 = user1.posts.create!(title: 'burak', text: 'Burak', commentscounter: 2, likescounter: 2)
    @post2 = user1.posts.create!(title: 'burak1', text: 'Burak1', commentscounter: 2, likescounter: 2)
    @post3 = user1.posts.create!(title: 'burak2', text: 'Burak2', commentscounter: 2, likescounter: 2)
    @post4 = user1.posts.create!(title: 'burak3', text: 'Burak3', commentscounter: 2, likescounter: 2)

    expect(user1.recentthreeposts).to eq([@post4, @post3, @post2])
  end
end
