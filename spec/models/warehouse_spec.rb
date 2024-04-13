require 'rails_helper'

# para metodos de classe utilizamos o . na frente do nome do metodo 
# porém assumimos que o metodo foi bem feito e ja esta testado.
# para metodos de instancia utilizamos o # na frente do nome do metodo



RSpec.describe Warehouse, type: :model do
  describe '#valid?' do

    context 'presence' do
      it 'false when name is empty' do
        #arrage
        warehouse = Warehouse.new(name: '', 
        code: 'TST', city: 'Rio de Janeiro', 
        area: '1234', address: 'test address', 
        cep: '12345678', description: 'test description')
        #act
        #assert
        expect(warehouse.valid?).to eq(false) 
      end
      it 'false when code is empty' do
        #arrage
        warehouse = Warehouse.new(name: 'test warehouse', 
        code: '', city: 'Rio de Janeiro', 
        area: '1234', address: 'test address', 
        cep: '12345678', description: 'test description')
        #act
        #assert
        expect(warehouse.valid?).to eq(false) 
      end

      it 'false when city is empty' do
        #arrage
        warehouse = Warehouse.new(name: 'test warehouse', 
        code: 'TST', city: '', 
        area: '1234', address: 'test address', 
        cep: '12345678', description: 'test description')
        #act
        #assert
        expect(warehouse.valid?).to eq(false) 
      end
      it 'false when area is empty' do
        # arrange
        warehouse = Warehouse.new(name: 'test warehouse', 
                                    code: '123', 
                                    city: 'Rio de Janeiro', 
                                    area: '', 
                                    address: 'test address', 
                                    cep: '12345678', 
                                    description: 'test description')
        # act
        # assert
        expect(warehouse.valid?).to eq(false) 
      end

      it 'false when address is empty' do
        # arrange
        warehouse = Warehouse.new(name: 'test warehouse', 
                                    code: '123', 
                                    city: 'Rio de Janeiro', 
                                    area: '1234', 
                                    address: '', 
                                    cep: '12345678', 
                                    description: 'test description')
        # act
        # assert
        expect(warehouse.valid?).to eq(false) 
      end

      it 'false when cep is empty' do
        # arrange
        warehouse = Warehouse.new(name: 'test warehouse', 
                                    code: '123', 
                                    city: 'Rio de Janeiro', 
                                    area: '1234', 
                                    address: 'test address', 
                                    cep: '', 
                                    description: 'test description')
        # act
        # assert
        expect(warehouse.valid?).to eq(false) 
      end
      it 'false when description is empty' do
      # arrange
      warehouse = Warehouse.new(name: 'test warehouse', 
                                  code: '123', 
                                  city: 'Rio de Janeiro', 
                                  area: '1234', 
                                  address: 'test address', 
                                  cep: '12345678', 
                                  description: '')
      # act
      # assert
      expect(warehouse.valid?).to eq(false) 
    end
    end

    context 'uniqueness' do
      it 'false when name is duplicated' do
        Warehouse.create(name: 'test warehouse', 
                                    code: '123', 
                                    city: 'niteroi', 
                                    area: '6789', 
                                    address: 'niteroi address', 
                                    cep: '12345678', 
                                    description: 'test description niteroi')
        warehouse = Warehouse.new(name: 'test warehouse', 
                                    code: '123', 
                                    city: 'Rio de Janeiro', 
                                    area: '1234', 
                                    address: 'test address', 
                                    cep: '12345678', 
                                    description: 'test description')
        # act
        # assert
        expect(warehouse.valid?).to eq(false)
      end

      it 'false when code is duplicated' do
      
        Warehouse.create(name: 'niteroi warehouse', 
                                    code: '123', 
                                    city: 'niteroi', 
                                    area: '6789', 
                                    address: 'niteroi address', 
                                    cep: '12345678', 
                                    description: 'test description niteroi')
        warehouse = Warehouse.new(name: 'test warehouse', 
                                    code: '123', 
                                    city: 'Rio de Janeiro', 
                                    area: '1234', 
                                    address: 'test address', 
                                    cep: '12345678', 
                                    description: 'test description')
        # act
        # assert
        expect(warehouse.valid?).to eq(false)
      end
    end

  end
end
