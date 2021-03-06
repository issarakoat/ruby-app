class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
         
  def to_s
    email
  end
  
  has_many :todos
  has_many :comments
  has_many :posts
  
  after_create :assign_default_role

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:visitor)
    else
      self.add_role(:visitor) if self.roles.blank?
    end
  end
  
  validate :must_have_a_role, on: :update
  def online?
    updated_at > 2.minutes.ago
  end

  private
  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "must have at least one role")
    end
  end
end
