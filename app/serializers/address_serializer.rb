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
class AddressSerializer
  include JSONAPI::Serializer
  attributes :street, :exterior_number, :interior_number, :neighborhood,
             :municipality, :city, :state, :zip_code, :country
end
