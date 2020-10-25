class HomeController < ApplicationController

  def top
  end

  def guest
  @guest_user = User.find_or_create_by!(name: "ゲストユーザー", email: 'guest@example.com', image_name: "user_sample.png") do |user|
    # user = User.find_or_create_by!(email: 'guest@example.com') do |user|
  user.password_digest = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
end
    session[:user_id] = @guest_user.id
    flash[:notice] = "ゲストユーザーとしてログインしました"
    redirect_to("/posts/index")
  end

end
