# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id                       :uuid             not null, primary key
#  name                     :string
#  description              :string           not null
#  internal_id              :integer          not null
#  purchase_price           :decimal(, )      default(0.0), not null
#  sale_price               :decimal(, )      default(0.0), not null
#  brand_id                 :uuid             not null
#  stock_quantity           :integer          default(0), not null
#  min_stock_quantity       :integer          default(0), not null
#  max_stock_quantity       :integer          default(0), not null
#  status                   :integer
#  base_measurement_unit_id :uuid             not null
#  product_presentation_id  :uuid             not null
#  deleted_at               :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
FactoryBot.define do
  factory :product do
    name { FFaker::Product.product_name }
    description { FFaker::Lorem.phrase }
    purchase_price { FFaker::Number.decimal }
    sale_price { FFaker::Number.decimal }
    brand
    stock_quantity { rand(0..99) }
    min_stock_quantity { 0 }
    max_stock_quantity { 99 }
    status { Product.statuses.keys.sample }
    base_measurement_unit
    product_presentation
  end
end
