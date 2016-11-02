class User < ApplicationRecord
  has_many :codes, dependent: :destroy
  has_many :uses, dependent: :destroy

  has_many :uses, dependent: :destroy
  has_many :using, through: :uses, source: :language

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: VALID_EMAIL_REGEX
end
