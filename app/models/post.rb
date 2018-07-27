class Post < ActiveRecord::Base
  validates :text, {presence: true, length: {maximum: 20}}
  validates :image, {presence: true}
end
