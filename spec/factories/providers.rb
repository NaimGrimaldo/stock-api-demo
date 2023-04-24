# frozen_string_literal: true

# == Schema Information
#
# Table name: providers
#
#  id                 :uuid             not null, primary key
#  legal_name         :string
#  nickname           :string           not null
#  first_name         :string
#  middle_name        :string
#  last_name          :string
#  maternal_last_name :string
#  birth_date         :date
#  email              :string           not null
#  phone              :string           not null
#  website            :string
#  rfc                :string
#  curp               :string
#  nationality        :string
#  internal_id        :integer          not null
#  starts_on          :date
#  provider_type      :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  deleted_at         :datetime
#
FactoryBot.define do
  factory :provider do
    email { FFaker::Internet.email }
    phone { FFaker::PhoneNumberMX.home_work_phone_number }
    rfc { 'XAXX010101' }
    trait :person_as_provider do
      first_name { FFaker::NameMX.name }
      middle_name { FFaker::NameMX.name }
      last_name { FFaker::NameMX.last_name }
      maternal_last_name { FFaker::NameMX.last_name }
      birth_date { rand(18..55).years.ago }
      curp { 'BACJ841223HASRVN09' }
      nationality { FFaker::Address.country_code }
      provider_type { :person }
    end

    trait :company_as_provider do
      legal_name { FFaker::Company.name }
      provider_type { :company }
      website { FFaker::Internet.http_url }
    end
  end
end
