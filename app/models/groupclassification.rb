class Groupclassification < ApplicationRecord
  belongs_to :grouptab
  
  validates :classification, presence: true
  validates :grouptab_id, presence: true
end
