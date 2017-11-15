class Grouptab < ApplicationRecord
  belongs_to :group
  
  validates :group_id, presence: true
  validates :name, presence: true
  
  has_many :grouplists
  has_many :groupclassifications
end
