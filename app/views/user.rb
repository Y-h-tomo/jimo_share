class User < ApplicationRecord
  has_secure_password
  # before_save { self.email = email.downcase }
  # validates :name, {presence: true,length: { maximum: 50 }}
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, uniqueness: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX }
  # validates :password, presence: true, length: { minimum: 6 }
  validates :name, { presence: true }
  validates :email, { presence: true, uniqueness: true }
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  # mount_uploader :image, ImageUploader

  def posts
    return Post.where(user_id: self.id)
  end
end
