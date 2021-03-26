class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_secure_password
  has_secure_token
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
  validates :password, confirmation: true
  validates :password,
            length: { minimum: 6 },
            if: -> { (new_record? || !password.nil?) }
end
