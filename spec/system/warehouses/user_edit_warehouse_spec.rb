require 'rails_helper'
require 'pry'

describe 'Usuário edita um galpão' do
  it 'a partir da pagina de detalhes' do
    # Arrange
    Warehouse.create!(
      name: 'Aeroporto test',
      code: 'TST',
      city: 'Testst',
      area: 100_000,
      address: 'Avenida do Aeroporto, 1000',
      cep: '15000-000',
      description: 'Galpao destinado para cargas internacionais'
    )

    # Act
    visit(root_path)
    click_on('Aeroporto test')
    click_on('Editar')

    # Assert
    expect(page).to have_content('Editar Galpão')
    expect(page).to have_field('Nome', with: 'Aeroporto test')
    expect(page).to have_field('Descrição', with: 'Galpao destinado para cargas internacionais')
    expect(page).to have_field('Código', with: 'TST')
    expect(page).to have_field('Endereço', with:'Avenida do Aeroporto, 1000')
    expect(page).to have_field('Cidade', with: 'Testst')
    expect(page).to have_field('CEP', with: '15000-000')
    expect(page).to have_field('Área', with: '100000')

  end

  it 'com sucesso' do
    # Arrange
    Warehouse.create!(
      name: 'Aeroporto test',
      code: 'TST',
      city: 'Testst',
      area: 100_000,
      address: 'Avenida do Aeroporto, 1000',
      cep: '15000-000',
      description: 'Galpao destinado para cargas internacionais'
    )
    # Act
    visit(root_path)
    click_on('Aeroporto test')
    click_on('Editar')

    fill_in('Nome', with: 'Aeroporto SP')
    fill_in('Código', with: 'GRU')
    fill_in('Cidade', with: 'Guarulhos')
    fill_in('Área', with: 100_000)
    fill_in('Endereço', with: 'Avenida do Aeroporto, 1000')
    fill_in('CEP', with: '15000-000')
    fill_in('Descrição', with: 'Galpao destinado para cargas internacionais')

    click_on('Atualizar Galpão')

    # Assert
    expect(page).to have_content('Aeroporto SP')
    expect(page).to have_content('GRU')
    expect(page).to have_content('Guarulhos')
    expect(page).to have_content('100000 m2')
    expect(page).to have_content('Avenida do Aeroporto, 1000 CEP: 15000-000')
    expect(page).to have_content('Galpao destinado para cargas internacionais')
  end

  it 'com dados inválidos' do
    # Arrange
    Warehouse.create!(
      name: 'Aeroporto test',
      code: 'TST',
      city: 'Testst',
      area: 100_000,
      address: 'Avenida do Aeroporto, 1000',
      cep: '15000-000',
      description: 'Galpao destinado para cargas internacionais'
    )
    # Act
    visit(root_path)
    click_on('Aeroporto test')
    click_on('Editar')

    fill_in('Nome', with: '')
    fill_in('Código', with: 'GRU')
    fill_in('Cidade', with: 'Guarulhos')
    fill_in('Área', with: 100_000)
    fill_in('Endereço', with: 'Avenida do Aeroporto, 1000')
    fill_in('CEP', with: '15000-000')
    fill_in('Descrição', with: 'Galpao destinado para cargas internacionais')

    click_on('Atualizar Galpão')

    # Assert
    expect(page).to have_content('Editar Galpão')
    expect(page).to have_content('Erro ao atualizar galpão!')
    expect(page).to have_content('Nome não pode ficar em branco')
  end


end