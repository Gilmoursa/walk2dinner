class UsersController < ApplicationController
    before_action :require_login, only: [:edit, :show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            redirect_to @user
        else
            flash[:alert] = "Sorry, your account could not be created."
            render 'new'
        end
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    def edit
        @user = User.find_by_id(params[:id])
    end

    def update
        @user = User.find_by_id(params[:id])
        @user.update_attributes(user_params)
        updated_data = user_params.as_json
        render json: {updates: updated_data}
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :address, :zip, :phone, :city, :state, :organization, :password, :password_confirmation)
    end

end
