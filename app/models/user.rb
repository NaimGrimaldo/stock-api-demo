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
class User < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :addresses, as: :owner, dependent: :destroy
  has_many :customers, through: :transactions,
                       source: :ownwer, source_type: :Customer

  enum gender: { male: 0, female: 1 }
  enum role: { admin: 0, supervisor: 1, salesman: 2 }

  validates :email, :first_name, :last_name, :phone, :gender,
            :role, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: {
    scope: %i[deleted_at],
    conditions: -> { not_deleted },
    case_sensitive: false
  }

  def name
    [first_name, middle_name,
     last_name, maternal_last_name].filter_map do |word|
       next if word.blank?

       word.to_s.strip
     end.join(' ')
  end
end
