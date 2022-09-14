class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:post_counter)
  end

  def recent_five_comments
    comments.last(5)
  end
end