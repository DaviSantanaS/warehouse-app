require 'rails_helper'

describe 'User view supplier details' do

  before(:each) do
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

  it 'can view supplier details' do
              
    visit suppliers_path
    click_on 'Alimentos XYZ'

    expect(page).to have_content('Comércio de Alimentos XYZ')
    expect(page).to have_content('4567890123')
    expect(page).to have_content('Avenida Principal, 200 - Centro, CEP: 54321-876')
    expect(page).to have_content('Rio de Janeiro')
    expect(page).to have_content('RJ')
    expect(page).to have_content('contato@alimentosxyz.com')

  end

  it 'can go back to suppliers list' do

    visit suppliers_path
    click_on 'Alimentos XYZ'
    click_on 'Voltar'

    expect(current_path).to eq suppliers_path
    expect(page).to have_content('Fornecedores')
    expect(page).to have_content('ABC Distribuidora')
    expect(page).to have_content('Alimentos XYZ')
    

  end

end