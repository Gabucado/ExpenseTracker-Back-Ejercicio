class User < ApplicationRecord
  has_secure_password

  has_many :accounts
  has_many :budgets
  has_many :goals

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
