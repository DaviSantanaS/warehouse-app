require 'rails_helper'


describe 'O usuario visita a tela inicial' do

  it 'e vê o nome da app' do
    # arrange
    # act
    visit('/')

    # assert
    expect(page).to have_content('Galpões & Estoque')
  end

end