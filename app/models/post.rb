class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: :User
  has_many :likes
  has_many :comments

  after_create :updatepostscounter

  def updatepostscounter
    author.increment!(:postscounter)
  end

  def recentfivecomments
    comments.order(created_at: :desc).limit(5)
  end
end
