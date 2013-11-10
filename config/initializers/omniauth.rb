Rails.application.config.middleware.use OmniAuth::Builder do
  oauth_provider = WeAreMany::Application.config.oauth_provider
  
  # key, secret
  provider :xing, oauth_provider[:xing]
  #provider :linkedin, oauth_provider[:linkedin][:key], oauth_provider[:linkedin][:secret], :scope => 'r_basicprofile r_emailaddress rw_nus'
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}