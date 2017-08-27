class SessionsController < ApplicationController
  def create
    @current_user = User.find_or_create_by(
      name: auth_hash['info']['name'],
      email: auth_hash['info']['email']
    )

    # @authorization = Authorization.find_or_create_by(
    #   provider: auth_hash['provider'],
    #   uid: auth_hash['uid'],
    #   user_id: @user.id
    # )
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
