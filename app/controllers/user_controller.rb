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
        if (@current_user.id).to_i == (params[:id]).to_i
            @this_is_current = true
            @viewing_user = User.joins(:portfolio).select("*").where(users: {id: @current_user.id})
            @viewing_user = @viewing_user.first!
        else
            @this_is_current = false
            @viewing_user = User.joins('LEFT OUTER JOIN "connections" ON "connections"."peer_id" = "users"."id"').joins(:portfolio).select("*").where(connections: {user_id: @current_user.id, peer_id: params[:id]})
            @viewing_user = @viewing_user.first!
        end
    end

    def edit     
        current_user = User.find(params[:id])
        if params[:first_name].length != 0
            current_user.first_name = params[:first_name]
        end
        if params[:last_name].length != 0
            current_user.last_name = params[:last_name]
        end
        if params[:email].length != 0
            current_user.email = params[:email]
        end
        if params[:password].length != 0
            if params[:password] == params[:password_confirmation]
                
                current_user.password = params[:password]
            else
                #  come back and incoporate this some other time
                @errors =  "Passwords do not match"
                redirect_to :back
            end
        end
        current_user.save()
        redirect_to :back
    end

        


    def require_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
