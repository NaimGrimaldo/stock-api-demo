# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id              :uuid             not null, primary key
#  owner_type      :string           not null
#  owner_id        :uuid             not null
#  street          :string           not null
#  exterior_number :string           not null
#  interior_number :string
#  neighborhood    :string           not null
#  municipality    :string
#  city            :string           not null
#  state           :string           not null
#  zip_code        :string           not null
#  country         :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  deleted_at      :datetime
#
FactoryBot.define do
  factory :address do
    association :owner, factory: :user
    street { FFaker::Address.street_name }
    exterior_number { FFaker::Address.building_number }
    interior_number { FFaker::Address.building_number }
    neighborhood { FFaker::Address.neighborhood }
    municipality { FFaker::AddressMX.municipality }
    city { FFaker::AddressMX.municipality }
    state { FFaker::AddressMX.state }
    zip_code { FFaker::AddressMX.zip_code }
    country { FFaker::Address.country_code }
  end
end
