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
FactoryBot.define do
  factory :base_measurement_unit do
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.phrase }
  end
end
