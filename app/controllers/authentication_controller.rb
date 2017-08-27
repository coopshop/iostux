class AuthenticationController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: :create

  def login
    redirect_to "https://discordapp.com/api/oauth2/authorize?client_id=#{ENV['DISCORD_CLIENT_ID']}&response_type=code&scope=identify"
  end
end
