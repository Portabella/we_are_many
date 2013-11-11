class User < ActiveRecord::Base
  #attr_accessible :first_name, :last_name, :job, :city, :country, :description

  devise :omniauthable, :omniauth_providers => [:xing]

  has_many :user_networks
  has_many :networks, through: :user_networks
  
  has_many :user_interests
  has_many :interests, through: :user_interests

  store :external_ids, accessors: [:xing]
  store :photos, accessors: [:xing]
end