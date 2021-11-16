class Api::V1::UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]
  before_action :order_params
  MAX_PAGINATION_LIMIT = 10

  def index
    @users = (apply_scopes(User.limit(limit).offset(params[:offset]))).order(created_at: @order)
    render json: UsersRepresenter.new(@users).as_json
  end

  def show
    render json: UserRepresenter.new(@user).as_json
  end

  def update
    if @user.update(user_params)
      render json: UserRepresenter.new(@user).as_json
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @user.destroy
  end

  private
    def limit
      [params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i].min
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:password, :email)
    end 

    def order_params
      @order = params.fetch(:order, "ASC") 
    end
end