require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/index' do
    it 'check if it brings success response' do
      get users_path
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'check the response body includes correct placeholder text' do
      get users_path
      expect(response.body).to include( '<li> <img src="https://picsum.photos/200/300"> </li>')
    end
  end

  describe 'GET users from /users/:id to show' do
    user = User.create!(name: 'chris', photo: 'https://picsum.photos/200/300', bio: 'I am John', postscounter: 4)

    it 'check if it brings success response' do
      get "/users/#{user.id}"
      expect(response).to be_successful
    end

    it 'check the response body includes correct placeholder text' do
      get "/users/#{user.id}"
      expect(response.body).to include(' <ul class="bio_info width"> ')
    end

    it 'renders the show template' do
      get "/users/#{user.id}"
      expect(response).to render_template('show')
    end
  end
end