class Code < ApplicationRecord
  belongs_to :language
  belongs_to :user

  validates :title, presence: true,  uniqueness: true

  validates :code, presence: true
end
