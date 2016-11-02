class Language < ApplicationRecord
  has_many :codes, dependent: :nullify
  has_many :uses, dependent: :destroy
  has_many :use_by, through: :uses, source: :user

  validates :name, presence: true, uniqueness: true
end
