class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    # self.current_user = @user

    @info = HTTParty.get("https://oauth.reddit.com/api/v1/me", headers: {
      "Authorization" => "bearer #{@user.token}",
      "User-Agent" => "Yaps/1.0 by contact"
    })

    @subreddits = HTTParty.get("https://oauth.reddit.com/subreddits/mine/subscriber.json", headers: {
    "Authorization" => "bearer #{@user.token}",
    "User-Agent" => "Yaps/1.0 by contact"
    })

    urls = @subreddits["data"]["children"].map { |child| child["data"]["url"] }

    binding.pry
    redirect_to welcome_index_path
  end

# /api/v1/me
# /api/v1/me/karma
# /subreddits/mine/subscriber.json
# 


  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end