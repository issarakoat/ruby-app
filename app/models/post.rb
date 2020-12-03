class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_rich_text :desc
end
