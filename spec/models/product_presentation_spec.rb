# frozen_string_literal: true

# == Schema Information
#
# Table name: product_presentations
#
#  id              :uuid             not null, primary key
#  name            :string           not null
#  description     :string           not null
#  factor_per_item :integer          default(1), not null
#  nickname        :string
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe ProductPresentation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
