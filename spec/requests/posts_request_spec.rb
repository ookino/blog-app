require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'GET /' do
    before(:each) { get user_posts_path user_id: 4 }
    it 'should return correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template('index')
    end

    it 'should check if correct placeholder is shown' do
      expect(response.body).to include('Author Posts')
    end
  end

  describe 'GET /show' do
    before(:each) { get('/users/4/posts/24') }
    it 'should return correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template('show')
    end

    it 'should check if correct placeholder is shown' do
      expect(response.body).to include('Post')
    end
  end
end
