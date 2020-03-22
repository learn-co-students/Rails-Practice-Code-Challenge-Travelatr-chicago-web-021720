class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates_uniqueness_of :name
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 30 }



end
