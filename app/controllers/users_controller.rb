class UsersController < ApplicationController
    def index
        @users = User.all 
    end

    def new
        @user = User.new 
    end

    def create
        if (user = User.create(user_params))
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            redirect_to root_path
        end 
    end

    def show 
        set_users
    end

    def edit 
        set_users
    end

    def update
        set_users
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    private 

        def set_users
            @user = User.find_by(id: params[:id])
        end

        def user_params 
            params.require(:user).permit(:username, :email, :password)
        end 
end
