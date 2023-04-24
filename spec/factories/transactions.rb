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
FactoryBot.define do
  factory :transaction do
    transaction_type { Transaction.transaction_types.keys.sample }
    association :owner, factory: :customer
    user
    product
    quantity { FFaker::Number.number }
  end
end
