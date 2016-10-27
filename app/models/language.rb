class Language < ApplicationRecord
  has_many :codes, dependent: :nullify
  
  validates :name, presence: true
end
