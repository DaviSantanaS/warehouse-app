require 'rails_helper'

describe 'User register a supplier' do
  it 'from the home page' do
    #arrange

    #act
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    click_on 'Cadastrar Novo Fornecedor'

    #assert
    expect(current_path).to eq(new_supplier_path)
    expect(page).to have_field('Razão Social')
    expect(page).to have_field('Nome Fantasia')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Endereço Completo')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('E-mail')
  end

  it 'successfully' do
    #arrange

    #act
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    click_on 'Cadastrar Novo Fornecedor'
    fill_in 'Razão Social', with: 'Nome do fornecedor'
    fill_in 'Nome Fantasia', with: 'Nome fantasia do fornecedor'
    fill_in 'CNPJ', with: '12345678901234'
    fill_in 'Endereço Completo', with: 'Endereço completo do fornecedor'
    fill_in 'Cidade', with: 'Cidade do fornecedor'
    fill_in 'Estado', with: 'Estado do fornecedor'
    fill_in 'E-mail', with: 'emailfornecedor@email.com'
    click_on 'Criar Fornecedor'



    #assert
    expect(current_path).to eq(suppliers_path)
    expect(page).to have_content('Fornecedor cadastrado com sucesso!')
    expect(page).to have_content('Nome fantasia do fornecedor')
    expect(page).to have_content('Cidade do fornecedor')
    expect(page).to have_content('Estado do fornecedor')

  end
  
  it 'with invalid data' do
    #arrange
  
    #act
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end  
    click_on 'Cadastrar Novo Fornecedor'
    fill_in 'Razão Social', with: ''
    fill_in 'Nome Fantasia', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço Completo', with: ''
    fill_in 'Cidade', with: ''
    fill_in 'Estado', with: ''
    fill_in 'E-mail', with: ''
    click_on 'Criar Fornecedor'
  
    #assert
    expect(page).to have_content('Erro ao cadastrar fornecedor!')
    expect(page).to have_content('Razão Social não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
    expect(page).to have_content('E-mail não pode ficar em branco')
    expect(page).to have_content('Nome Fantasia não pode ficar em branco')
  end

end