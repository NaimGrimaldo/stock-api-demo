# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id                 :uuid             not null, primary key
#  legal_name         :string
#  nickname           :string           not null
#  first_name         :string
#  middle_name        :string
#  last_name          :string
#  maternal_last_name :string
#  birth_date         :date
#  email              :string
#  phone              :string
#  gender             :integer
#  rfc                :string
#  curp               :string
#  nationality        :string
#  customer_type      :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  deleted_at         :datetime
#
FactoryBot.define do
  factory :customer do
    nickname { FFaker::Internet.user_name }
    email { FFaker::Internet.email }
    phone { FFaker::PhoneNumberMX.home_work_phone_number }
    trait :person_as_customer do
      first_name { FFaker::NameMX.name }
      middle_name { FFaker::NameMX.name }
      last_name { FFaker::NameMX.last_name }
      maternal_last_name { FFaker::NameMX.last_name }
      birth_date { rand(18..55).years.ago }
      gender { Customer.genders.keys.sample }
      curp { 'BACJ841223HASRVN09' }
      nationality { FFaker::Address.country_code }
      customer_type { :person }
    end

    trait :company_as_customer do
      legal_name { FFaker::Company.name }
      rfc { 'XAXX010101' }
      customer_type { :company }
    end
  end
end
