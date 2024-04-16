require 'rails_helper'

describe 'User view supplier' do

  it 'theres no registered supplier ' do

    visit suppliers_path

    expect(current_path).to eq(suppliers_path)
    expect(page).to have_content('Fornecedores')
    expect(page).to have_content('Nenhum fornecedor cadastrado')
    
  end

  it 'theres a registered supplier' do

    Supplier.create!(corporate_name: 'Razão Social', brand_name: 'Nome fantasia', 
    registration_number: '1234567890', full_address: 'endereço completinho aqui', 
    city: 'cidade do fornecedor', state: 'EF', email: 'email do fornecedor')

    visit suppliers_path

    expect(page).to have_content('Fornecedores')
    expect(page).to have_content('Nome fantasia')
    expect(page).to have_content('cidade do fornecedor - EF')

  end


end