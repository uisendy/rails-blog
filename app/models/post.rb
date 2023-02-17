class Post < ApplicationRecord
  after_save :update_posts_count

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def update_posts_count
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.includes(:author).limit(5).order(created_at: :asc)
  end
end
