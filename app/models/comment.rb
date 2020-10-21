class Comment < ApplicationRecord
   validates  :user_id, {presence: true}
   validates  :post_id, {presence: true}
   belongs_to :post, dependent: :destroy
   belongs_to :user

   def post
      return Post.find_by(id: self.post_id)
   end

   def user
      return User.find_by(id: self.user_id)
   end

end
