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
class ProductSerializer
  
end
