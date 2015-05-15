class Comment < ActiveRecord::Base
  belongs_to :post
  validates :body, presence: true, allow_blank: false
end
