require 'rails_helper'

describe 'User view product model' do
  it 'from menu' do
    
    visit root_path
    within('nav') do 
      click_on 'Modelos de Produtos'
    end

    expect(current_path).to eq(product_models_path)
  end

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
    
    ProductModel.create!(
      name: 'TV 32', 
      weight: 8000, 
      height: 70, 
      width: 50, 
      length: 30, 
      sku: 'TV32-SAMS', 
      supplier: Supplier.first
      )  
    ProductModel.create!(
      name: 'Soundbar Pro', 
      weight: 3000, 
      height: 100, 
      width: 500, 
      length: 300, 
      sku: 'SB123-SAMS', 
      supplier: Supplier.first
      )  


      visit root_path
      within('nav') do
        click_on 'Modelos de Produtos'
      end

      expect(page).to have_content('TV 32')
      expect(page).to have_content('Soundbar Pro')
      expect(page).to have_content('Samsung')
      expect(page).to have_content('TV32-SAMS')
      expect(page).to have_content('SB123-SAMS')

  end

  it 'and there are no registered product models' do

    visit root_path
    click_on 'Modelos de Produtos'

    expect(page).to have_content('Nenhum modelo de produto cadastrado')

  end


end