class Personaltab < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, presence: true
  
  has_many :personallists
  has_many :personalclassifications
end
