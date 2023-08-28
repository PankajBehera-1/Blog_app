class PostsController < ApplicationController
    
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_post, only: [:edit, :update, :destroy]

  
    def index
      @posts = Post.includes(user: :avatar).all
      @current_user = current_user
    end
  
    def show
        @post = Post.find(params[:id])
    end
  
    def new
      @post = current_user.posts.build
    end
  
    def create
      @post = current_user.posts.build(post_params)
  
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @post.user == current_user
        if @post.update(post_params)
          redirect_to @post, notice: 'Post was successfully updated.'
        else
          render :edit
        end
      else
        redirect_to @post, alert: "You don't have permission to edit this post."
      end
    end
  
    def destroy
      @post = Post.find(params[:id]) # Make sure to fetch the post
      if @post.user == current_user
        @post.destroy
        redirect_to posts_path, notice: 'Post was successfully deleted.'
      else
        redirect_to posts_path, alert: 'You are not authorized to delete this post.'
      end
    end
    

    private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :content, :image, :video)
    end

    def store
        # upload image to cloudinary
        @image = Cloudinary::Uploader.upload(params[:media])
        # create a new post object and save to db
        @post = Post.new({:title => params[:title], :text => params[:text], :author => params[:author],  :media => @image['secure_url']})
        @post.save
        redirect_to('/')
    end

    protected
  

    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    end
  end
  

