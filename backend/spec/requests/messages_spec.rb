require 'rails_helper'

RSpec.describe 'Messages API', type: :request do
  let(:user) { User.create(email: 'user@example.com', password: 'password123') }
  let(:auth_token) { user.generate_auth_token }

  it 'permite envio de mensagem autenticado' do
    post '/messages', params: { content: 'Hello, world!' }, headers: { Authorization: "Bearer #{auth_token}" }
    expect(response).to have_http_status(:created)
  end
end
