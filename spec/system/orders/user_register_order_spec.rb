require 'rails_helper'

describe 'Usuario cadastra um pedido' do

  it 'e deve estar autenticado' do

    visit root_path
    click_on 'Registrar Pedido'

    expect(current_path).to eq(new_user_session_path)
  end

  it 'com sucesso' do

    user = User.create!(
      name: 'Testador',
      email: 'test@email.com',
      password: '123456'
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

    warehouse =   Warehouse.create!(
      name: 'Galpao Praia',
      code: 'RMV',
      city: 'Testst',
      area: 100_000,
      address: 'Avenida do Aeroporto, 1000',
      cep: '15000-000',
      description: 'Galpao destinado para cargas internacionais'
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
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABC12345')

    login_as user, scope: :user
    visit root_path
    click_on 'Registrar Pedido'
    select "Galpao Praia - RMV", from: 'Galpão Destino'
    select "Apple - Apple Inc.", from: 'Fornecedor'
    fill_in 'Data de Entrega Estimada', with: '01/01/2025'
    click_on 'Gravar'

    expect(page).to have_content('Pedido cadastrado com sucesso')
    expect(page).to have_content("Pedido ABC12345")
    expect(page).to have_content('Galpão Destino: Galpao Praia - RMV')
    expect(page).to have_content('Fornecedor: Apple - Apple Inc.')
    expect(page).to have_content('Data de Entrega Estimada: 01/01/2025')
    expect(page).to have_content('Usuario Responsavel: Testador - test@email.com')
    expect(page).not_to have_content(warehouse2.name)
    expect(page).not_to have_content(supplier.corporate_name)

  end



end