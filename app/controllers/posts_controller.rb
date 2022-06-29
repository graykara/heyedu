# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @category = request.path.split('/')[1]

    posts_by_category = Post.where(category: @category).order(created_at: :desc)

    if @category == 'faq'
      @posts = posts_by_category
      render 'faq'
    else
      @pagy, @posts = pagy(posts_by_category, items: 10)
      @total = posts_by_category.length
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
    @category = request.path.split('/')[1]
  end

  # GET /posts/new
  def new
    @category = request.path.split('/')[1]
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @category = request.path.split('/')[1]
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html do
          redirect_to url_for(controller: :posts, action: :show, id: @post.id),
                      notice: t('flash.actions.create.notice')
        end
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html do
          redirect_to url_for(controller: :posts, action: :show, id: @post.id),
                      notice: t('flash.actions.update.notice', resource_name: 'Post')
        end
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html do
        redirect_to url_for(controller: :posts, action: :index),
                    notice: t('flash.actions.destroy.notice')
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    # params.fetch(:post, {})
    params.require(:post).permit(:title, :content, :status, :category, :user_id)
  end
end
