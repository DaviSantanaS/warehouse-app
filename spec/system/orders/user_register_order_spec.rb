require 'rails_helper'

describe 'Usuario cadastra um pedido' do

  it 'com sucesso' do

    user = User.create!(
      name: 'Testador',
      email: 'test@email.com',
      password: '123456'
    )

    warehouse =   Warehouse.create!(
      name: 'Galpao Praia',
      code: 'RMV',
      city: 'Testst',
      area: 100_000,
      address: 'Avenida do Aeroporto, 1000',
      cep: '15000-000',
      description: 'Galpao destinado para cargas internacionais'
    )

    warehouse2 = Warehouse.create!(
      name: 'Galpão Aeroporto',
      code: 'ADD',
      city: 'Testst',
      area: 200_000,
      address: 'Avenida do Aeroporto, 2000',
      cep: '25000-000',
      description: 'Galpao destinado para cargas nacionais'
    )

    supplier =  Supplier.create!(
      brand_name: 'Samsung',
      corporate_name: 'Samsung Eletronics ltda',
      registration_number: '1234567890',
      full_address: 'Rua das Flores, 123, São Paulo, SP',
      city: 'São Paulo',
      state: 'SP',
      email: 'samsung@samsung.com'
    )

    supplier2 =  Supplier.create!(
      brand_name: 'Apple',
      corporate_name: 'Apple Inc.',
      registration_number: '0987654321',
      full_address: 'One Apple Park Way, Cupertino, CA',
      city: 'Cupertino',
      state: 'CA',
      email: 'apple@apple.com'
    )

    login_as user, scope: :user
    visit root_path
    click_on 'Registrar Pedido'
    select warehouse.name, from: 'Galpão Destino'
    select supplier.corporate_name, from: 'Fornecedor'
    fill_in 'Data Prevista', with: '01/01/2025'
    click_on 'Gravar'

    expect(page).to have_content('Pedido cadastrado com sucesso')
    expect(page).to have_content(warehouse.name)
    expect(page).to have_content(supplier.corporate_name)
    expect(page).to have_content('01/01/2025')
    expect(page).to have_content('Usuario Responsavel: Testador')
    expect(page).not_to have_content(warehouse2.name)
    expect(page).not_to have_content(supplier2.corporate_name)



  end



end