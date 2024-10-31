require 'rails_helper'

RSpec.describe User, type: :model do
  it 'cria um usuário com autenticação de dois fatores' do
    user = User.create(email: 'teste@example.com', password: 'password123')
    expect(user.otp_secret).not_to be_nil
  end
  
  it 'valida presença do email' do
    user = User.new(password: 'password123')
    expect(user.valid?).to be_falsey
  end

  it 'valida formato do email' do
    user = User.new(email: 'invalid-email', password: 'password123')
    expect(user.valid?).to be_falsey
  end

  it 'valida presença da senha' do
    user = User.new(email: 'user@example.com')
    expect(user.valid?).to be_falsey
  end
end
