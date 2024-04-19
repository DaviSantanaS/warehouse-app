require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe '#valid?' do
    it 'is invalid without a name' do
      Supplier.create!(
        brand_name: 'Samsung',
        corporate_name: 'Samsung Eletronics ltda',
        registration_number: '1234567890',
        full_address: 'Rua das Flores, 123, São Paulo, SP',
        city: 'São Paulo',
        state: 'SP',
        email: 'samsung@samsung.com'
        )


      product_model = ProductModel.new(name: '',
                                       weight: 8000,
                                       height: 70,
                                       width: 50,
                                       length: 30,
                                       sku: 'TV32-SAMS',
                                       supplier: Supplier.first)

      expect(product_model).to be_invalid
    end

    it 'is invalid without a sku' do
      Supplier.create!(
        brand_name: 'Samsung',
        corporate_name: 'Samsung Eletronics ltda',
        registration_number: '1234567890',
        full_address: 'Rua das Flores, 123, São Paulo, SP',
        city: 'São Paulo',
        state: 'SP',
        email: 'samsung@samsung.com'
      )
      product_model = ProductModel.new(name: 'TV 32',
                                       weight: 8000,
                                       height: 70,
                                       width: 50,
                                       length: 30,
                                       sku: '',
                                       supplier: Supplier.first)

      expect(product_model).to be_invalid

    end


  end

end
