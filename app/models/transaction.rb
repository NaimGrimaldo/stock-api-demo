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
end
