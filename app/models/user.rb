class User < ActiveRecord::Base
  validates :name, {presence: true}
  validates :email, {uniqueness: true, presence: true}
  validates :password, {presence: true}
end
