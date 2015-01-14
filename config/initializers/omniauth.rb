Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit, Rails.application.secrets.reddit_api_key, Rails.application.secrets.reddit_api_secret, duration: "permanent", scope: "identity,history,mysubreddits", provider_ignores_state: true
end





