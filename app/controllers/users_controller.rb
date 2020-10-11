class UsersController < ApplicationController

    def index

    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        redirect_to user_path(@user)
        session[:user_id] = @user.id
    end

    def edit

    end

    def update

    end

    def show
        if logged_in?
            @user = User.find_by_id(params[:id])
        else
            redirect_to root_path
        end
    end

    def destroy

    end

    private

    def user_params
        params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin, :password)
    end
end
