require 'rails_helper'

describe 'User sign in' do
  it 'successfully' do

    User.create!(
      name: 'user',
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

    expect(page).not_to have_link('Entrar')
    expect(page).to have_button('Sair')
    within('nav') do
      expect(page).to have_content('user@email.com')
    end
    expect(page).to have_content('Login efetuado com sucesso.')

  end

  it 'and log out' do
    User.create!(
      name: 'user',
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
    click_on 'Sair'

    expect(page).to have_content('Logout efetuado com sucesso.')
    expect(page).to have_link('Entrar')
    expect(page).not_to have_link('Sair')
    expect(page).not_to have_content('user@email.com')



  end

end