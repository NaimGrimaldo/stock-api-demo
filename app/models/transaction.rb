# frozen_string_literal: true

# == Schema Information
#
# Table name: transactions
#
#  id               :uuid             not null, primary key
#  owner_type       :string           not null
#  owner_id         :uuid             not null
#  user_id          :uuid             not null
#  transaction_type :integer
#  status           :integer          default("pending"), not null
#  product_id       :uuid             not null
#  quantity         :integer
#  total            :decimal(, )
#  deleted_at       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Transaction < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :product
  belongs_to :user, optional: true

  enum transaction_type: { purchase: 0, sale: 1 }
  enum status: { pending: 0, approved: 1, rejected: 2 }

  delegate :name, to: :user, prefix: true, allow_nil: true
  delegate :nickname, :name, to: :owner, prefix: true, allow_nil: true
  delegate :sold_quantity, :purchased_quantity, :stock_quantity, :stocked?,
           :out_stocked?, :over_stocked?, :discontinued?,
           :min_stock_quantity, :max_stock_quantity, :name,
           :pending_supplies, to: :product, prefix: true, allow_nil: true

  validates :quantity, presence: true
  # validates :quantity, comparison: {
  #   greater_than: 0,
  #   less_than_or_equal_to: :product_stock_quantity,
  #   message: I18n.t('activerecord.errors.models.transaction.min_stock_quantity_overflowed')
  # }, if: :sale?

  # validates :quantity, comparison: {
  #   greater_than_or_equal_to: :product_min_stock_quantity,
  #   less_than_or_equal_to: :product_pending_supplies,
  #   message: I18n.t('activerecord.errors.models.transaction.max_stock_quantity_overflowed')
  # }, if: :purchase?

  validate :can_be_processed?
  validate :appropiate_type?
  after_validation :calculate_total_amount!

  after_update :recalculate_stock, if: :saved_change_to_status?

  private

  def recalculate_stock
    return unless approved?

    product.update(
      stock_quantity: (product_purchased_quantity - product_sold_quantity)
    )
  end

  def can_be_processed?
    return negative_quantity_error if quantity.negative?

    return discontinued_product_error if product_discontinued?

    return purchase_validation_process? if purchase?

    sale_validation_process?
  end

  def discontinued_product_error
    errors.add(
      :product,
      I18n.t('activerecord.errors.models.product.discontinued')
    )
  end

  def purchase_validation_process?
    return if product_pending_supplies >= quantity

    errors.add(
      :quantity,
      I18n.t(
        'activerecord.errors.models.transaction.max_stock_quantity_overflowed'
      )
    )
  end

  def sale_validation_process?
    return if product_stock_quantity <= quantity

    errors.add(
      :quantity,
      I18n.t(
        'activerecord.errors.models.transaction.min_stock_quantity_overflowed'
      )
    )
  end

  def appropiate_type?
    if owner.is_a?(Provider)
      return if purchase?

      errors.add(
        :quantity,
        I18n.t(
          'activerecord.errors.models.transaction.not_allowed_for_provider'
        )
      )
    else
      return if sale?

      errors.add(
        :quantity,
        I18n.t(
          'activerecord.errors.models.transaction.not_allowed_for_customer'
        )
      )
    end
  end

  def negative_quantity_error
    errors.add(
      :quantity,
      I18n.t(
        'activerecord.errors.models.transaction.negative_quantity'
      )
    )
  end

  def calculate_total_amount!
    amount = if sale?
               quantity * product.sale_price
             else
               quantity * product.purchase_price
             end

    self.total = amount
  end
end
