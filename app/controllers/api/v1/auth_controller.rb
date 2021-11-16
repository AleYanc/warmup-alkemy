class Api::V1::AuthController < ApplicationController
  class AuthenticationError < StandardError; end

  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from AuthenticationError, with: :handle_unauthenticated

  before_action :user, only: [:create]

  def create
    raise AuthenticationError unless user.authenticate(params.require(:password))
    token = AuthTokenService.call(user.id)
    render json: {token: token}, status: :created
  end

  def sign_up
    @user = User.new(user_params)

    if @user.save
      render json: UserRepresenter.new(@user).as_json, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def user
      @user ||= User.find_by(email: params.require(:email))
    end

    def parameter_missing(e)
      render json: {error: e.message}, status: :unprocessable_entity
    end

    def handle_unauthenticated
      head :unauthorized
    end
    
    def user_params
      params.permit(:password, :email)
    end 

end