# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :uuid             not null, primary key
#  first_name         :string           not null
#  middle_name        :string
#  last_name          :string           not null
#  maternal_last_name :string
#  birth_date         :date
#  email              :string           not null
#  phone              :string           not null
#  gender             :integer
#  rfc                :string
#  curp               :string
#  nationality        :string
#  role               :integer
#  internal_id        :integer
#  starts_on          :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  deleted_at         :datetime
#
FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    first_name { FFaker::NameMX.name }
    middle_name { FFaker::NameMX.name }
    last_name { FFaker::NameMX.last_name }
    maternal_last_name { FFaker::NameMX.last_name }
    phone { FFaker::PhoneNumberMX.home_work_phone_number }
    birth_date { rand(18..55).years.ago }
    gender { User.genders.keys.sample }
    rfc { 'XAXX010101' }
    curp { 'BACJ841223HASRVN09' }
    nationality { FFaker::Address.country_code }
    role { User.roles.keys.sample }
    starts_on { rand(1..12).months.ago }
  end
end
