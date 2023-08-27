class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:username]
  has_many :posts, dependent: :destroy
  has_one :avatar
  validates :username, presence: true, uniqueness: true
  attr_accessor :date_of_birth, :gender
  mount_uploader :avatar, AvatarUploader
end

