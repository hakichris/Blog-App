class Comment < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post

  after_create :updatecommentscounter

  def updatecommentscounter
    post.increment!(:commentscounter)
  end
end
