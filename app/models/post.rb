class Post < ApplicationRecord
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
  
    private :updatepostscounter
end