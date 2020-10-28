class Comment < ApplicationRecord
   validates  :user_id, { presence: true }
   validates  :post_id, { presence: true }
   validates  :comment, { presence: true }
   belongs_to :post
   belongs_to :user

   def post
      return Post.find_by(id: self.post_id)
   end

   def user
      return User.find_by(id: self.user_id)
   end

end
