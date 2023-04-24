# frozen_string_literal: true

# == Schema Information
#
# Table name: base_measurement_units
#
#  id          :uuid             not null, primary key
#  name        :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#
class BaseMeasurementUnit < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, :description, presence: true
  validates :name, uniqueness: {
    scope: %i[deleted_at],
    conditions: -> { not_deleted },
    case_sensitive: false
  }
end
