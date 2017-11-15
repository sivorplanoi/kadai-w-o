class Personallist < ApplicationRecord
  belongs_to :personaltab
  
  validates :content, presence: true
  validates :limit, length: { maximum: 10 }
  validates :personaltab_id, presence: true
end
