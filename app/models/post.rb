class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  validates_presence_of :title
  validates :content, length: {minimum: 100}

end
