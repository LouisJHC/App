class SearchesController < ApplicationController
def index
end

def location
end

def address
    @search = params[:user_search]
    @post = Post.all
end

end
