class Supplier < ApplicationRecord
  validates :corporate_name, :registration_number, :email, :brand_name,  presence: true
  has_many :product_models

  def full_name
    "#{brand_name} - #{corporate_name}"
  end
end
