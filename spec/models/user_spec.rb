require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#description' do
    it 'exibe o nome e o email' do
      user = User.new(name: 'João', email: 'joao@email.com')

      expect(user.description).to eq('João - joao@email.com')
    end
  end
end
