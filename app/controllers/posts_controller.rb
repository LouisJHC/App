class PostsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show]
    def index
        @posts = Post.all
    end
    def new
         @post = current_user.posts.build
         @categories = Category.all.map{|a| [a.name, a.id]}
    end
    def create
        @post = current_user.posts.build(post_params)
        @post.category_id = params[:category_id]
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end
    def show
        @post = Post.find(params[:id])
    end
    def edit
        @post = Post.find(params[:id])
        @categories = Category.all.map{|a| [a.name, a.id]}
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_path
    end
    def update
        @post.category_id = params[:category_id]
        @post = Post.find(params[:id])
        
        if @post.update(post_params)
            redirect_to posts_path
        else
            render 'edit'
        end
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :content, :address, :latitude, :longitude, :category_id)
    end
end
