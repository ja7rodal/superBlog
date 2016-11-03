# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(100)
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_secure_password validations: true

    validates :email, uniqueness: true, format: /@/
  validates :password, presence: true, on: :create, length: { in: 8..20 }, allow_nil: true, confirmation: true

end
