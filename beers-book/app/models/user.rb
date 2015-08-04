class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { self.email = email.downcase }

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :user_name, presence: true, uniqueness: true, allow_blank: false
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, length: {minimum: 8}

  has_many :posts, dependent: :destroy
  has_many :user_friendships
  has_many :friends, -> {where(user_friendships: {state: 'accepted'})}, through: :user_friendships
  has_many :pending_user_friendships, -> {where(state: 'pending')}, class_name: 'UserFriendship', foreign_key: :user_id 
  has_many :pending_friends, through: :pending_user_friendships, source: :friend

end
