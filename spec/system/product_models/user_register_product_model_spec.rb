require 'rails_helper'

describe 'User register product model' do
  it 'successfully' do
    Supplier.create!(
      brand_name: 'Samsung',
      corporate_name: 'Samsung Eletronics ltda',
      registration_number: '1234567890',
      full_address: 'Rua das Flores, 123, São Paulo, SP',
      city: 'São Paulo',
      state: 'SP',
      email: 'samsung@samsung.com',
      )

    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar modelo de produto'

    fill_in 'Nome', with: 'TV 32'
    fill_in 'Peso', with: 10_000
    fill_in 'Altura', with: 70
    fill_in 'Largura', with: 50
    fill_in 'Comprimento', with: 30
    fill_in 'SKU', with: 'TV32-SAMS'
    select 'Samsung', from: 'Fornecedor'
    click_on 'Enviar'

    expect(page).to have_content('Modelo de produto cadastrado com sucesso')
    expect(page).to have_content('TV 32')
    expect(page).to have_content('Peso: 10000g')
    expect(page).to have_content('Dimensões: 70cm x 50cm x 30cm')
    expect(page).to have_content('SKU: TV32-SAMS')
    expect(page).to have_content('Fornecedor: Samsung')

    end


  it 'and must fill in all mandatory fields' do
    Supplier.create!(
      brand_name: 'Samsung',
      corporate_name: 'Samsung Eletronics ltda',
      registration_number: '1234567890',
      full_address: 'Rua das Flores, 123, São Paulo, SP',
      city: 'São Paulo',
      state: 'SP',
      email: 'samsung@samsung.com',
      )

    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar modelo de produto'

    fill_in 'Nome', with: ''
    fill_in 'Peso', with: 10_000
    fill_in 'Altura', with: 70
    fill_in 'Largura', with: 50
    fill_in 'Comprimento', with: 30
    fill_in 'SKU', with: ''
    select 'Samsung', from: 'Fornecedor'
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível cadastrar o modelo de produto')

  end


end