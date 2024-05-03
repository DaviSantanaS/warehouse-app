# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


3.times do |i|
  Supplier.create!(
    brand_name: "TechCom #{i + 1}",
    corporate_name: "InovaTech #{i + 1} Ltda",
    registration_number: "IT#{i + 100}56789",
    full_address: "Rua das Palmeiras, #{i + 200}, Rio de Janeiro, RJ",
    city: 'Rio de Janeiro',
    state: 'RJ',
    email: "contato@techcom#{i + 1}.com"
  )
end

3.times do |i|
  ProductModel.create!(
    name: "Smartphone #{i + 1} Plus",
    weight: (i + 1) * 200,
    height: (i + 1) * 10,
    width: (i + 1) * 70,
    length: (i + 1) * 50,
    sku: "SP#{i + 100}P",
    supplier: Supplier.offset(i).first
  )
end

3.times do |i|
  User.create!(
    name: "Cliente #{i + 1}",
    email: "cliente#{i + 1}@mail.com",
    password: 'cliente123'
  )
end

3.times do |i|
  Warehouse.create!(
    name: "Armazém #{i + 1}",
    code: "AR#{i + 1}",
    city: 'Rio de Janeiro',
    area: 120_000 + (i * 20_000),
    address: "Avenida das Indústrias, #{i + 300}, Rio de Janeiro, RJ",
    cep: "2000#{i + 100}",
    description: "Armazém destinado para armazenamento de produtos diversos."
  )
end
