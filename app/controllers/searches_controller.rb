class SearchesController < ApplicationController
    def index
        @searches = Search.all
        if params[:search]
            @searches = Search.search(params[:search]).order("created_at DESC")
        else
            @searches = Search.all.order("created_at DESC")
        end
    end
end
