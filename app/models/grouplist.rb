class Grouplist < ApplicationRecord
  belongs_to :grouptab
  
  validates :content, presence: true
  validates :limit, length: { maximum: 10 }
  validates :grouptab_id, presence: true
end
