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
  has_secure_password

  validates :email, uniqueness: true, format: /@/
  #validates :password_confirmation, presence: true, on: :create
  validates :password, confirmation: true, presence: true,
                        length: { minimum: 8 }, on: :create
end
