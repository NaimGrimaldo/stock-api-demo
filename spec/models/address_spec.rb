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
require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
