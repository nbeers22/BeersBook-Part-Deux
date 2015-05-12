class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_votable

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end

  default_scope -> {order(created_at: :desc)}
  
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, allow_blank: false

end