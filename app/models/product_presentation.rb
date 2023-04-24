# frozen_string_literal: true

# == Schema Information
#
# Table name: product_presentations
#
#  id              :uuid             not null, primary key
#  name            :string           not null
#  description     :string           not null
#  factor_per_item :integer          default(1), not null
#  nickname        :string
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class ProductPresentation < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, :description, :nickname, :factor_per_item, presence: true
  validates :nickname, uniqueness: {
    scope: %i[deleted_at],
    conditions: -> { not_deleted },
    case_sensitive: false
  }
  before_validation :ensure_nickname, unless: :nickname?

  private

  def ensure_nickname
    self.nickname = name&.parameterize&.underscore
  end
end
