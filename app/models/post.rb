class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}
  validates :image, {presence: true}


  # mount_uploader :image, ImageUploader

  def user
    return User.find_by(id: self.user_id)
  end

    # def generate_image
    #   self.image = loop do
    #     random_token = SecureRandom.urlsafe_base64(nil, false) + ".jpg"
    #     break random_token unless self.class.exists?(image: random_token)
    #   end
    # end

end
