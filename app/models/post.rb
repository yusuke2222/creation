class Post < ActiveRecord::Base
  validates :text, {presence: true, length: {maximum: 25}}
  validates :image, {presence: true}
  validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end
end
