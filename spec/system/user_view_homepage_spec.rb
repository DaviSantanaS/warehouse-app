require 'rails_helper'


describe 'O usuario visita a tela inicial' do

  it 'e vê o nome da app' do
    # arrange
    # act
    visit(root_path)

    # assert
    expect(page).to have_content('Galpões & Estoque')
  end

  it 'e vê os galpões cadastrados' do

    # arrange
    # cadastrar 2 galpoes: Rio e Maceio
    Warehouse.create(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000)
    Warehouse.create(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50_000)


    # act
    visit(root_path)

    # assert
    'garantir que eu vejo na tela o nome dos galpões Rio e Maceio'
    expect(page).not_to have_content('Não existem galpões cadastrados.')
    expect(page).to have_content('Rio')
    expect(page).to have_content('SDU')
    expect(page).to have_content('Rio de Janeiro')
    expect(page).to have_content('60000 m2')

    expect(page).to have_content('Maceio')
    expect(page).to have_content('MCZ')
    expect(page).to have_content('Maceio')
    expect(page).to have_content('50000 m2')
  end

  it 'e não existem galpões cadastrados' do
    # arrange

    # act
    visit(root_path)

    # assert
    expect(page).to have_content("Não existem galpões cadastrados.")

  end



end