class SessionsController < ApplicationController
  
  def return_reddit_details
    @data = {}
    @data["subreddits"] = current_user.interests[0]["subreddits"]
    @data["profile"]    = current_user.profile

    respond_to do |format|
      format.json { render :json => @data }
    end
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    # self.current_user = @user

    @profile = HTTParty.get("https://oauth.reddit.com/api/v1/me", headers: {
      "Authorization" => "bearer #{@user.token}",
      "User-Agent" => "Yaps/1.0 by contact"
    })

    @subreddits = HTTParty.get("https://oauth.reddit.com/subreddits/mine/subscriber.json", headers: {
    "Authorization" => "bearer #{@user.token}",
    "User-Agent" => "Yaps/1.0 by contact"
    })

    profile_login = Profile.where({user_id: @user.id}).first_or_create
    profile_login.update({
        name:    @profile["name"],
        created: @profile["created"],
        gold_creddits: @profile["gold_creddits"],
        link_karma:    @profile["link_karma"],
        comment_karma:    @profile["comment_karma"],
        over_18:    @profile["over_18"],
        is_gold:    @profile["is_gold"],
        is_mod:    @profile["is_mod"],
      })


    interest_login = Interest.where({user_id: @user.id}).first_or_create
    @urls = @subreddits["data"]["children"].map do |child|
      { url: child["data"]["url"], display_name: child["data"]["display_name"] }
    end
    interest_login.update({
      subreddits: @urls
      })

    redirect_to welcome_index_path
  end

  def logout_session
    reset_session
    # binding.pry
    redirect_to root_path
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