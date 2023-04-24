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
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
