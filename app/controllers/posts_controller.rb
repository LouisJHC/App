class PostsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show]
    def index
        if params[:category].blank?
            @posts = Post.all
        else
            @category_id = Category.find_by(name: params[:category]).id
            @posts = Post.where(:category_id => @category_id)
        end
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
        @post = Post.find(params[:id])
        @post.category_id = params[:category_id]
        
        if @post.update(post_params)
            redirect_to posts_path
        else
            render 'edit'
        end
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :content, :address, :latitude, 
        :longitude, :category_id, :distance)
    end
end
