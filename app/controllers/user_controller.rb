class UserController < ApplicationController
    def index

    end
   

    def create
        @new_user = User.new(require_params)
        if @new_user.save
            session[:user_id] = @new_user.id
            redirect_to  '/portfolio/new'
        else
            flash[:errors] = @new_user.errors.full_messages
            redirect_to '/'
        end
    end

    def show
        @current_user = User.find(session[:user_id])
        @viewing_user = User.joins(:portfolio).select("*").find(params[:id])
    end

    def require_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
