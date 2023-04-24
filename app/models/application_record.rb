# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  acts_as_paranoid

  scope :not_deleted, -> { where(deleted_at: nil) }
end
