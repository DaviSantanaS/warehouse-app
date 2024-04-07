require 'rails_helper'

describe 'Usuario ve detalhes de um galpao' do
  it 'e ve informações adicionais ' do
    # Arrange
    Warehouse.create(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                     address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                     description: 'Galpao destinado para cargas internacionais')
    # Act
    visit(root_path)
    click_on('Aeroporto SP')

    # Assert
    expect(page).to have_content('Galpão GRU')
    expect(page).to have_content('Nome: Aeroporto SP')
    expect(page).to have_content('Cidade: Guarulhos')
    expect(page).to have_content('Área: 100000 m2')
    expect(page).to have_content('Endereço: Avenida do Aeroporto, 1000 CEP: 15000-000')
    expect(page).to have_content('Galpao destinado para cargas internacionais')
  end

  it 'E volta para a tela inicial' do
    # Arrange
    Warehouse.create(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                     address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                     description: 'Galpao destinado para cargas internacionais')
    # Act
    visit(root_path)
    click_on('Aeroporto SP')
    click_on('Voltar')
    # Assert
    expect(current_path).to eq('/')
  end
end


