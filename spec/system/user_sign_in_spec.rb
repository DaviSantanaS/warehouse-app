require 'rails_helper'

describe 'User sign in' do
  it 'successfully' do

    User.create!(
      email: 'user@email.com',
      password: 'userpassword'
    )

    visit root_path
    click_on 'Entrar'
    within('form') do
      fill_in 'E-mail', with: 'user@email.com'
      fill_in 'Senha', with: 'userpassword'
      click_on 'Entrar'
    end

    expect(page).not_to have_link ('Entrar')
    expect(page).to have_link ('Sair')
    within('nav') do
      expect(page).to have_content('user@email.com')
    end
    expect(page).to have_content('Login efetuado com sucesso.')

  end

end