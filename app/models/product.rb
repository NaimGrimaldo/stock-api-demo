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
class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :base_measurement_unit
  belongs_to :product_presentation
  has_many :transactions, dependent: :destroy
  has_many :sales, -> { sale.approved },
           class_name: :Transaction, dependent: :destroy, inverse_of: :product
  has_many :purchases, -> { purchase.approved },
           class_name: :Transaction, dependent: :destroy, inverse_of: :product
  has_many :customers, through: :transactions,
                       source: :ownwer, source_type: :Customer
  has_many :providers, through: :transactions,
                       source: :ownwer, source_type: :Provider

  enum status: { stocked: 0, out_stocked: 1, discontinued: 2, over_stocked: 3 }

  delegate :name, to: :brand, allow_nil: true, prefix: true
  delegate :name, to: :base_measurement_unit, allow_nil: true, prefix: true
  delegate :nickname, to: :product_presentation, allow_nil: true, prefix: true
  validates :name, :description, :purchase_price, :sale_price,
            :min_stock_quantity, :max_stock_quantity, :status,
            presence: true
  validates :stock_quantity, comparison: {
    greater_than_or_equal_to: :min_stock_quantity,
    less_than_or_equal_to: :max_stock_quantity,
    message: I18n.t('activerecord.errors.models.product.quantity_overflowed')
  }
  after_update :ensure_product_in_stock, if: :saved_change_to_stock_quantity?

  def sold_quantity
    sales.sum(:quantity)
  end

  def purchased_quantity
    purchases.sum(:quantity)
  end

  def pending_supplies
    max_stock_quantity - stock_quantity
  end

  def expenses
    purchases.sum(:total)
  end

  def incomes
    sales.sum(:total)
  end

  def profits
    incomes - expenses
  end

  private

  def ensure_product_in_stock
    if (min_stock_quantity..max_stock_quantity).cover?(stock_quantity)
      stocked!
    elsif stock_quantity < min_stock_quantity
      out_stocked!
    else
      over_stocked!
    end
  end
end
