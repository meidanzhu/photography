class CategoriesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @categories = Category.alpha
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to categories_path(@category)
        else
            render :new
        end
    end

    def show
        @category = Category.find(params[:id])
    end

    private

    def category_params
        params.require(:category).permit(:name, photo_attributes: [:title, :caption])
    end
end
