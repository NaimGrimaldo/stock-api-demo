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
FactoryBot.define do
  factory :brand do
    name { FFaker::Company.name }
  end
end
