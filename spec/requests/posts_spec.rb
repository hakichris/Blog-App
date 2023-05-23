require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.new(name: 'Something',
                  photo: 'http://localhost:3000/something.jpg',
                  bio: 'Something test',
                  postscounter: 0)
  user.save
  post = Post.new(
    title: 'Something',
    text: 'Something test',
    author: user,
    commentscounter: 0,
    likescounter: 0
  )
  post.save
  
  describe 'GET /users/id/posts/index' do
    it 'check if it brings success response' do
      get user_posts_path(:user_id)
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get user_posts_path(:user_id)
      expect(response).to render_template('index')
    end

    it 'check the response body includes correct placeholder text' do
      get user_posts_path(:user_id)
      expect(response.body).to include('<h3> List of previous Posts and respective comments:</h3>')
    end
  end

  describe 'GET users from /users/:id to show' do
    user = User.create!(name: 'chris', photo: 'https://picsum.photos/200/300', bio: 'I am chris', postscounter: 4)
    post = Post.create!(author: user, title: 'title', text: ' Post text 1', commentscounter: 0, likescounter: 0)

    it 'check if it brings success response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to be_successful
    end

    it 'check the response body includes correct placeholder text' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('<div class="post_comment">')
    end

    it 'renders the show template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template('show')
    end
  end
end
