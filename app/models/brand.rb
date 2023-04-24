# frozen_string_literal: true

# == Schema Information
#
# Table name: brands
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Brand < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: {
    scope: %i[deleted_at],
    conditions: -> { not_deleted },
    case_sensitive: false
  }
end
