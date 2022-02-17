require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'GET /' do
    before(:example) { get('/users/2/posts') }
    it 'should return correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template('index')
    end

    it 'should check if correct placeholder is shown' do
      expect(response.body).to include('Posts by user')
    end
  end

  describe 'GET /show' do
    before(:example) { get('/users/2/posts/3') }
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
