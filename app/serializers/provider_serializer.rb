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
class ProviderSerializer
  include JSONAPI::Serializer
  attributes :legal_name, :nickname, :name, :first_name, :middle_name,
             :last_name, :maternal_last_name, :birth_date, :email, :phone,
             :rfc, :curp, :nationality, :website, :nationality,
             :internal_id, :starts_on, :provider_type
end
