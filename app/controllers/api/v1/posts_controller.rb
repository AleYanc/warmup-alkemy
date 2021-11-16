require 'net/http'
require 'uri'

class Api::V1::PostsController < ApplicationController

  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate_user, only: [:create, :upate, :destroy]
  MAX_PAGINATION_LIMIT = 10

  has_scope :by_title
  has_scope :by_category

  def index
    @posts = (apply_scopes(Post.limit(limit).offset(params[:offset]))).order(created_at: order)
    render json: PostsRepresenter.new(@posts).as_json
  end

  def show
    render json: PostRepresenter.new(@post).as_json
  end 

  def create
    @post = Post.new(post_params)
    if @post.save && image_exists?(@post.img)
      render json: PostRepresenter.new(@post).as_json
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: PostRepresenter.new(@post).as_json, status: 200
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end

  def retrieve_deleted
    @posts = Post.only_deleted
    render json: PostsRepresenter.new(@posts).as_json
  end

  def recover
    @post = Post.only_deleted.where("id = #{params[:id]}", "not dead yet").first.recover
    render json: {msg: "Post recovered"}
  end
  

  private
    def limit
      [params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i].min
    end

    def post_params
      params.permit(:title, :content, :img, :category, :user_id)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def order
      params.fetch(:order, :asc)
    end 
end
