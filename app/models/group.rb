class Group < ApplicationRecord
  
  belongs_to :user
  has_many :relationships
  has_many :members, through: :relationships, source: :user
  
  has_many :grouptabs
  
  def join_this_group(user)
    self.relationships.find_or_create_by(user_id: user.id)
  end
  
  def leave_this_group(user)
    relationship = self.relationships.find_by(user_id: user.id)
    relationship.destroy if relationship
  end
  
  def already_this_group?(user)
    self.members.include?(user)
  end
  
end
