require 'rails_helper'

describe 'User sign up' do
  it 'successfully' do
    visit root_path
    click_on 'Entrar'
    click_on 'Sign up'

    fill_in 'Nome', with: 'Teste'
    fill_in 'E-mail', with: 'teste@gmail.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('Boas vindas! Você realizou seu registro com sucesso.')
    expect(page).to have_button('Sair')
    # expect(page).to have_content('Olá, Teste')
    expect(page).to have_content('teste@gmail.com')
    expect(User.first.name).to eq('Teste')
  end

  context 'and must fill in all fields' do
    it 'name' do
      visit root_path
      click_on 'Entrar'
      click_on 'Sign up'

      fill_in 'Nome', with: ''
      fill_in 'E-mail', with: 'teste@gmail.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirme sua senha', with: '123456'
      click_on 'Sign up'

      expect(page).to have_content('Nome não pode ficar em branco')


    end

  end

end