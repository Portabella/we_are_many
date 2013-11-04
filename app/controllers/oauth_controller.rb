class OauthController < ApplicationController

  before_filter :set_consumer

  def sign_up
    request_token = @consumer.get_request_token(oauth_callback: (Rails.env.production? ? 'http://boiling-depths-9831.herokuapp.com/callback' : 'http://localhost:3000/callback'))
    session[:token] = request_token.token
    session[:secret] = request_token.secret
    # print request_token
    redirect_to request_token.authorize_url
  end  

  def contact_request 
    @consumer.get_request_token(oauth_callback: (Rails.env.production? ? 'http://boiling-depths-9831.herokuapp.com/callback' : 'http://localhost:3000/callback'))
    #@access_token.request(:get, "https://api.xing.com/v1/user/#{params[:user_id]}/contact_request")
  end

  def callback
    request_token = OAuth::RequestToken.new(@consumer, session[:token], session[:secret])
    @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier]) 

    result = @access_token.request(:get, "https://api.xing.com/v1/users/me")
    json = JSON(result.body)

    person = json['users'][0]
    user_created = false
    @user =  User.find_or_create_by_email( person['active_email']) do |user|
      # user.first_name = person['first_name']
      user.last_name            = "#{person['last_name']}"
      user.first_name           = "#{person['first_name']}"
      user.external_ids[:xing]  = person['page_name']
      user.photos[:xing]        = person['photo_urls']["large"]
      user.city                 = person['business_address']['city']
      user_created          = true
    end

    redirect_to user_created ? edit_user_path(@user) : root_url
    
  end

  private

  def set_consumer
    @consumer = OAuth::Consumer.new("6a72b7a5fa3bbdf9864c", "e8d8427a9340643c34dfed9a0ae34fb3c5a52328", {
      :site => "https://api.xing.com",
      :request_token_path => "/v1/request_token",
      :authorize_path => "/v1/authorize",
      :access_token_path => "/v1/access_token"
    })
  end
 
end