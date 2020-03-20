class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def to_s
        "#{self.country} - #{self.name}"
    end

    def featured_post
        self.posts.max_by { |post| post.likes }
    end

    def recent_posts(n)
        self.posts.order(updated_at: :desc).limit(n)
    end
end
