class Todo < ApplicationRecord
  # validates :content,  presence: true, length: { :minimum => 5 }
  
  has_rich_text :content
  belongs_to :user
end
