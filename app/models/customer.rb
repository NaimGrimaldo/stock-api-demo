# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id                 :uuid             not null, primary key
#  legal_name         :string
#  nickname           :string           not null
#  first_name         :string
#  middle_name        :string
#  last_name          :string
#  maternal_last_name :string
#  birth_date         :date
#  email              :string
#  phone              :string
#  gender             :integer
#  rfc                :string
#  curp               :string
#  nationality        :string
#  customer_type      :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  deleted_at         :datetime
#
class Customer < ApplicationRecord
  has_many :addresses, as: :owner, dependent: :destroy
  has_many :transactions, as: :owner, dependent: :destroy
  has_many :products, through: :transactions

  enum gender: { male: 0, female: 1 }
  enum customer_type: { person: 0, company: 1 }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, :customer_type, :phone, presence: true
  validates :email, uniqueness: {
    scope: %i[deleted_at],
    conditions: -> { not_deleted },
    case_sensitive: false
  }
  validates :nickname, uniqueness: {
    scope: %i[deleted_at],
    conditions: -> { not_deleted },
    case_sensitive: false
  }

  validates :legal_name, :rfc, presence: true, if: :company?
  validates :first_name, :last_name, :birth_date, :gender,
            :nationality, presence: true, if: :person?
  before_validation :ensure_nickname, unless: :nickname?

  accepts_nested_attributes_for :addresses, allow_destroy: true,
                                            reject_if: :all_blank
  accepts_nested_attributes_for :transactions, allow_destroy: true,
                                               reject_if: :all_blank

  def name
    return legal_name if company?

    [first_name, middle_name,
     last_name, maternal_last_name].filter_map do |word|
       next if word.blank?

       word.to_s.strip
     end.join(' ')
  end

  private

  def ensure_nickname
    self.nickname = name&.parameterize&.underscore
  end
end
