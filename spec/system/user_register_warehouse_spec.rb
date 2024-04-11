require 'rails_helper'

describe 'Usuário cadastra um galpão' do
    it 'a partir da tela inicial' do
        #arrange
        
        #act
        visit root_path
        click_on 'Cadastrar Galpão'

        #assert
        expect(page).to have_field('Nome')
        expect(page).to have_field('Descrição')
        expect(page).to have_field('Código')
        expect(page).to have_field('Endereço')
        expect(page).to have_field('Cidade')
        expect(page).to have_field('CEP')
        expect(page).to have_field('Área')
    end

    it 'com sucesso' do
        #arrange

        #act
        visit root_path
        click_on 'Cadastrar Galpão'
        fill_in 'Nome', with: 'Nome do galpão'
        fill_in 'Descrição', with: 'Descrição do galpão'
        fill_in 'Código', with: '1234'
        fill_in 'Endereço', with: 'Endereço do galpão'
        fill_in 'Cidade', with: 'Cidade do galpão'
        fill_in 'CEP', with: '12345-678'
        fill_in 'Área', with: '12345'
        click_on 'Cadastrar'

        #assert
        expect(current_path).to eq(root_path)
        expect(page).to have_content('Galpão cadastrado com sucesso!')
        expect(page).to have_content('Nome do galpão')
        expect(page).to have_content('Descrição do galpão')
        expect(page).to have_content('1234')
        expect(page).to have_content('Endereço do galpão')
        expect(page).to have_content('Cidade do galpão')
        expect(page).to have_content('12345-678')
        expect(page).to have_content('12345 m2')
    end
end