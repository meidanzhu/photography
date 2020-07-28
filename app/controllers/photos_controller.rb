class PhotosController < ApplicationController
    def index
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    private
        def photo_params
            params.require(:photo).permit(:title, :caption)
        end

end
