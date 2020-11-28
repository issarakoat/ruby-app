class Todo < ApplicationRecord
  # validates :content,  presence: true, length: { :minimum => 5 }
  
  has_rich_text :content
  belongs_to :user
  extend FriendlyId
  friendly_id :content, use: :slugged
  
  include PublicActivity::Model
  # tracked
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
