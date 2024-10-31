require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { User.create(email: 'user@example.com', password: 'password123') }

  it 'permite login com credenciais corretas' do
    post '/users/sign_in', params: { email: user.email, password: user.password }
    expect(response).to have_http_status(:success)
  end

  it 'impede login com credenciais incorretas' do
    post '/users/sign_in', params: { email: user.email, password: 'wrongpassword' }
    expect(response).to have_http_status(:unauthorized)
  end
end
