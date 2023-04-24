# frozen_string_literal: true

# == Schema Information
#
# Table name: base_measurement_units
#
#  id          :uuid             not null, primary key
#  name        :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#
require 'rails_helper'

RSpec.describe BaseMeasurementUnit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
