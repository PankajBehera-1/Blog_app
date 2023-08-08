class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
  
    def index
      @posts = Post.all
    end
  
    def show
        @post = Post.find(params[:id])
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
  
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        
        redirect_to posts_path, notice: 'Post was successfully deleted.'
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

  end
  