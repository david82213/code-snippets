class Code < ApplicationRecord
  belongs_to :language

  validates :title, presence: true,  uniqueness: true
  
  validates :code, presence: true
end
