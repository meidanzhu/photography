class PhotosController < ApplicationController
    before_action :set_photo, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in

    def index
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @photos = @category.photos
          else
            @photos = Photo.all
        end
    end

    def new
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @photo = @category.photos.build
        else
            @photo = Photo.new
            @photo.build_category
        end
    end

    def create
        @photo = current_user.photos.build(photo_params)
        if @photo.save
            @photo.image.purge
            @photo.image.attach(params[:photo][:image])
            redirect_to photo_path(@photo)
        else
            @category = Category.find_by_id(params[:category_id]) if params[:category_id]
            render :new, alert: "Invalid information."
        end
    end

    def show
        
    end

    def edit
       
    end

    def update
        if @photo.valid?
            @photo.update(photo_params)
            redirect_to photo_path(@photo)
        else
            render :edit, alert: "Invalid information."
        end
    end

    def destroy
        photo = Photo.find(params[:id])
        photo.destroy
        redirect_to photos_path
    end

    private

        def photo_params
            params.require(:photo).permit(:title, :caption, :image, :category_id)
        end

        def set_photo
            @photo = Photo.find_by_id(params[:id])
            redirect_to photos_path if !@photo
        end

end