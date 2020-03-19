class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: {minimum: 30}

    def total_likes
        likes = self.posts.map { |p| p.likes }
        likes.sum
    end 

end
