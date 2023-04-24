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
class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :first_name, :middle_name, :last_name,
             :maternal_last_name, :birth_date, :email, :phone,
             :gender, :rfc, :curp, :nationality, :role,
             :internal_id, :starts_on
end
