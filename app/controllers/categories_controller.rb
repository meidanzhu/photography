class CategoriesController < ApplicationController
    def index 
        @categories = Category.all 
    end

    def new 
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save 
            redirect_to category_path(@category)
        else 
            @category.photos.build 
            render :new 
        end
    end

    def show 
        @category = Category.find(params[:id])
    end

    private
        def category_params 
            params.require(:category).permit(:name, photos_attributes: [:title, :caption])
        end
end
