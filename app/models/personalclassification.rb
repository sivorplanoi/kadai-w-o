class Personalclassification < ApplicationRecord
  belongs_to :personaltab
  
  validates :classification, presence: true
  validates :personaltab_id, presence: true
end
