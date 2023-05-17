class Like < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post

  after_create :updatelikescounter

  def updatelikescounter
    post.increment!(:likescounter)
  end
end
