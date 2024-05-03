require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    it 'deve ter um codigo' do
      user = User.create!(
        name: 'eu mesmo',
        email: 'eu@email.com',
        password: '123456'
      )

      warehouse =   Warehouse.create!(
        name: 'Galpao de cargas internacionais',
        code: 'RBV',
        city: 'Testst',
        area: 100_000,
        address: 'Avenida do Aeroporto, 1000',
        cep: '15000-000',
        description: 'Galpao destinado para cargas internacionais'
      )

      supplier =  Supplier.create!(
        brand_name: 'Samsung',
        corporate_name: 'Samsung Eletronics ltda',
        registration_number: '1234567890',
        full_address: 'Rua das Flores, 123, São Paulo, SP',
        city: 'São Paulo',
        state: 'SP',
        email: 'samsung@samsung.com'
      )

      order = Order.new(user: user, warehouse: warehouse,
                            supplier: supplier, estimated_delivery_date: '2022-12-25')


      expect(order.valid?).to eq(true)
    end
  end

  describe "gera um codigo aleatorio" do
    it 'ao criar um novo pedido' do
    user = User.create!(
      name: 'eu mesmo',
      email: 'eu@email.com',
      password: '123456'
    )

    warehouse =   Warehouse.create!(
      name: 'Galpao de cargas internacionais',
      code: 'RBV',
      city: 'Testst',
      area: 100_000,
      address: 'Avenida do Aeroporto, 1000',
      cep: '15000-000',
      description: 'Galpao destinado para cargas internacionais'
    )

    supplier =  Supplier.create!(
      brand_name: 'Samsung',
      corporate_name: 'Samsung Eletronics ltda',
      registration_number: '1234567890',
      full_address: 'Rua das Flores, 123, São Paulo, SP',
      city: 'São Paulo',
      state: 'SP',
      email: 'samsung@samsung.com'
    )

    order = Order.create!(user: user, warehouse: warehouse,
                          supplier: supplier, estimated_delivery_date: '2022-12-25')


    expect(order.code).not_to be_empty
    expect(order.code.size).to eq(8)
    end

    it 'e o codigo é unico' do

      user = User.create!(
        name: 'eu mesmo',
        email: 'eu@email.com',
        password: '123456'
      )

      warehouse =   Warehouse.create!(
        name: 'Galpao de cargas internacionais',
        code: 'RBV',
        city: 'Testst',
        area: 100_000,
        address: 'Avenida do Aeroporto, 1000',
        cep: '15000-000',
        description: 'Galpao destinado para cargas internacionais'
      )

      supplier =  Supplier.create!(
        brand_name: 'Samsung',
        corporate_name: 'Samsung Eletronics ltda',
        registration_number: '1234567890',
        full_address: 'Rua das Flores, 123, São Paulo, SP',
        city: 'São Paulo',
        state: 'SP',
        email: 'samsung@samsung.com'
      )

      order = Order.create!(user: user, warehouse: warehouse,
                        supplier: supplier, estimated_delivery_date: '2022-12-25')
      order2 = Order.create!(user: user, warehouse: warehouse,
                        supplier: supplier, estimated_delivery_date: '2023-11-15')

      expect(order.code).not_to eq(order2.code)

    end
  end
end
