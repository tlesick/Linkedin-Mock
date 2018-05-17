class ConnectionController < ApplicationController
    # make sure that you can't make the same connection 
    def create
        current_user = User.find(session[:user_id])
        user_to_connect = User.find_by(email: params[:user_email])
        send_request = Connection.create(user_id: current_user.id, peer_id: user_to_connect.id, status: 'pending')
        if Connection.find_by(user_id: current_user.id, peer_id: user_to_connect.id)
        else
            Connection.create(user_id: current_user.id, peer_id: user_to_connect.id)
            
        end
        redirect_to '/portfolio/index'
    end

    def destroy
        connection_to_destroy = Connection.find(params[:id])
        connection_to_destroy.destroy()
        redirect_to '/portfolio/index'
    end


   
    def update 
        connection_request = Connection.find(params[:id])
        if params[:decision] == 'accept'
            connection_request.status = 'complete'
            connection_request.save()
        else
            connection_request.destroy()
        end
        redirect_to '/portfolio/index'
    end
end
