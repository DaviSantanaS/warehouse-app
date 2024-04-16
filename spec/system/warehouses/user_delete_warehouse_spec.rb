require 'rails_helper'


describe 'Usuario remove um galpão' do
  it 'com sucesso' do
  #Arrange
  Warehouse.create!(
      name: 'Aeroporto para remover',
      code: 'RMV',
      city: 'Testst',
      area: 100_000,
      address: 'Avenida do Aeroporto, 1000',
      cep: '15000-000',
      description: 'Galpao destinado para cargas internacionais'
    )
  #Act
  visit root_path
  click_on 'Aeroporto para remover'
  click_on 'Remover'
  
  #Assert
  expect(current_path).to eq(root_path)
  expect(page).to have_content('Galpão removido com sucesso')
  expect(page).not_to have_content('Aeroporto para remover')
  expect(page).not_to have_content('RMV')
  end

  it 'e não remove outros galpões' do
    #Arrange
    Warehouse.create!(
      name: 'Aeroporto para remover',
      code: 'RMV',
      city: 'Testst',
      area: 100_000,
      address: 'Avenida do Aeroporto, 1000',
      cep: '15000-000',
      description: 'Galpao destinado para cargas internacionais'
    )
    Warehouse.create!(
      name: 'Aeroporto para manter',
      code: 'NRM',
      city: 'Testst',
      area: 100_000,
      address: 'Avenida do Aeroporto, 1000',
      cep: '15000-000',
      description: 'Galpao destinado para cargas internacionais'
    )
    
    #Act
    visit root_path
    click_on 'Aeroporto para remover'
    click_on 'Remover'
        
    #Assert
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Galpão removido com sucesso')
    expect(page).not_to have_content('Aeroporto para remover')
    expect(page).not_to have_content('RMV')
    expect(page).to have_content('Aeroporto para manter')
    expect(page).to have_content('NRM')

  end
end