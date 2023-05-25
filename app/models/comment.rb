class Comment < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post

  after_create :updatecommentscounter
  after_destroy :decrementcommentscounter

  def decrementcommentscounter
    post.decrement!(:commentscounter)
  end

  def updatecommentscounter
    post.increment!(:commentscounter)
  end
end
