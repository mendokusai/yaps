class User < ActiveRecord::Base

# HTTParty.get("https://oauth.reddit.com/api/v1/me", headers: {
#   "Authorization" => "bearer #{@user.token}",
#   "User-Agent" => "Yaps/1.0 by contact"
# })

def self.find_or_create_from_auth_hash(auth_hash)
  user = where({provider: auth_hash[:provider], uid: auth_hash[:uid]}).first_or_create
  user.update(
    name: auth_hash.info.name,
    token: auth_hash.credentials.token,
    secret: auth_hash.credentials.secret
    )
  user
end

end
