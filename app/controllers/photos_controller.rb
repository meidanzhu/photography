class PhotosController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        @photos = current_user.photos
    end

    def new
        @photo = Photo.new
        @photo.build_category
    end

    def create
        @photo = current_user.photos.build(photo_params)
        if @photo.valid?
            @photo.save
            redirect_to photo_path(@photo)
        else
            render :new, alert: "Invalid information."
        end
    end

    def show
        set_photo
    end

    def edit
        set_photo
    end

    def update
        set_photo
        if @photo.save
            @photo.update(photo_params)
            redirect_to photo_path(@photo)
        else
            render :edit, alert: "Invalid information."
        end
    end

    def destroy
        photo = Photo.find(params[:id]).destroy
        redirect_to user_path(current_user)
    end

    private
        def set_photo
            @photo = Photo.find_by_id(params[:id])
        end

        def photo_params
            params.require(:photo).permit(:title, :caption, :category_id, category_attributes: [:name])
        end

end
