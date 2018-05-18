class PortfolioController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        @connections = Connection.joins(user: :portfolio).select("*")
        @pending_requests = User.joins('LEFT OUTER JOIN "connections" ON "connections"."peer_id" = "users"."id"').select("*").where(connections: {status: 'pending',user_id: @user.id})
        @possible_connections =  User.joins('LEFT OUTER JOIN "connections" ON "connections"."peer_id" = "users"."id"').joins(:portfolio).select("*").where(connections: {id: nil}).where.not(email: @user.email)
        @current_connections = User.joins('LEFT OUTER JOIN "connections" ON "connections"."peer_id" = "users"."id"').select("*").where(connections: {status: 'complete', user_id: @user.id})
    end

    
    def create
        @new_portfolio = Portfolio.create(
            user_id: session[:user_id], 
            JobTitle: params[:jobTitle], 
            description: params[:description], 
            startDate: params[:startDate], 
            endDate: params[:endDate])

        if @new_portfolio.save
            redirect_to '/portfolio/index'
        else
            flash[:errors] = @new_portfolio.errors.full_messages
            redirect_to '/portfolio/new'
        end
    end

    def edit
        current_user = Portfolio.find_by(user_id: session[:user_id])
        if params[:jobTitle].length != 0
            current_user.JobTitle = params[:jobTitle]
        end

        if params[:description].length != 0
            current_user.description = params[:description]
        end

        if params[:startDate].length != 0
            current_user.startDate = params[:startDate]
        end

        if params[:endDate].length != 0
            current_user.endDate = params[:endDate]
        end
        current_user.save()
        redirect_to :back
    end
end
