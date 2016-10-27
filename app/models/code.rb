class Code < ApplicationRecord
  belongs_to :language
  
  validates :title, presence: true
  validates :code, presence: true
end
