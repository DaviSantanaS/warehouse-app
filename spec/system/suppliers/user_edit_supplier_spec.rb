require 'rails_helper'

describe 'User edit supplier' do
  
  before (:each) do
    Supplier.create!(corporate_name: 'Empresa ABC Ltda.', 
                 brand_name: 'ABC Distribuidora', 
                 registration_number: '0987654321', 
                 full_address: 'Rua das Flores, 100 - Bairro Feliz, CEP: 12345-678', 
                 city: 'São Paulo', 
                 state: 'SP', 
                 email: 'contato@empresaabc.com')

    Supplier.create!(corporate_name: 'Comércio de Alimentos XYZ', 
                 brand_name: 'Alimentos XYZ', 
                 registration_number: '4567890123', 
                 full_address: 'Avenida Principal, 200 - Centro, CEP: 54321-876', 
                 city: 'Rio de Janeiro', 
                 state: 'RJ', 
                 email: 'contato@alimentosxyz.com')
  end
  
  it 'successfully' do

    visit suppliers_path
    click_on 'Alimentos XYZ'
    click_on 'Editar'
    fill_in 'Razão Social', with: 'Comercial de Alimentos XYZ Ltda.'
    fill_in 'Nome Fantasia', with: 'Alimentos XYZ Ltda.'
    fill_in 'CNPJ', with: '45678901234567'
    fill_in 'Endereço Completo', with: 'Avenida Principal, 200 - Centro, CEP: 54321-876'
    fill_in 'Cidade', with: 'Rio de Sabugueiro'
    fill_in 'Estado', with: 'RS'
    fill_in 'E-mail', with: 'contatoltda@alimentosxyz.com'
    click_on 'Atualizar Fornecedor'

    expect(current_path).to eq(supplier_path(Supplier.last))
    expect(page).to have_content('Fornecedor atualizado com sucesso!')
    expect(page).to have_content('Comercial de Alimentos XYZ Ltda.')
    expect(page).to have_content('45678901234567')
    expect(page).to have_content('Avenida Principal, 200 - Centro, CEP: 54321-876')
    expect(page).to have_content('Rio de Sabugueiro')
    expect(page).to have_content('RS')
    expect(page).to have_content('contatoltda@alimentosxyz.com')
    expect(page).not_to have_content('Comércio de Alimentos XYZ')

  end

  it 'and go back without confirm changes' do

    visit suppliers_path
    click_on 'ABC Distribuidora'
    click_on 'Editar'
    fill_in 'Razão Social', with: ''
    fill_in 'Nome Fantasia', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'E-mail', with: ''
    click_on 'Voltar'

    expect(current_path).to eq(supplier_path(Supplier.first))
    expect(page).to have_content('ABC Distribuidora')
    expect(page).to have_content('0987654321')
    expect(page).to have_content('Empresa ABC Ltda.')
    expect(page).to have_content('contato@empresaabc.com')



  end

end