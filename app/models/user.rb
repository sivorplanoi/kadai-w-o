class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
         #:recoverable, :confirmable, :lockable, :timeoutable
  
  has_many :groups
  has_many :relationships
  has_many :belonging_groups, through: :relationships, source: :group

  has_many :personaltabs
  
end