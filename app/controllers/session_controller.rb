class SessionController < ApplicationController
    def create
        attempted_user = User.find_by(email: params[:email])
        puts attempted_user
        
        if attempted_user.nil?
            flash[:errors] = ['Please register first']
            redirect_to('/')
        else
            if attempted_user.authenticate(params[:password])
                session[:user_id] = attempted_user.id
                redirect_to('/portfolio/index')
            else
                flash[:errors] = ["Invalid email or password combination"]
                redirect_to('/')
            end
        end

    end

    def destroy
        reset_session
        redirect_to '/'
    end
end
