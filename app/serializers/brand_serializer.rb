# frozen_string_literal: true

# == Schema Information
#
# Table name: brands
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BrandSerializer
  include JSONAPI::Serializer
  attributes :name
end
