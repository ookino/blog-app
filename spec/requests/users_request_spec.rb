require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) { get(users_path) }
    it 'should return correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template('index')
    end

    it 'should check if correct placeholder is shown' do
      expect(response.body).to include('Users')
    end
  end

  describe 'GET /show' do
    before(:each) { get('/users/1') }
    it 'should return correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template('show')
    end

    it 'should check if correct placeholder is shown' do
      expect(response.body).to include('Author Details')
    end
  end
end
