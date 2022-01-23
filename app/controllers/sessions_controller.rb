class SessionsController < ApplicationController 
    skip_before_action :require_login
    include CurrentUserConcern

    def create 
        begin 
            user = User
                    .find_by(email: params["user"]["email"])
                    .try(:authenticate, params["user"]["password"])
            # if user
            payload = {user_id: user.id}
            token = encode_token(payload)
            session[:user_id] = user.id
            render json: {
                status: :created, 
                logged_in: true, 
                user: user,
                token: token
            }
        rescue NoMethodError => e
            render json: {
                error: e,
                status: 400 # universal unauthorized code
            }
        end 

    end 

    def logged_in 
        if @current_user
            payload = {user_id: @current_user.id}
            token = encode_token(payload)
            render json: {
                logged_in: true,
                user: @current_user,
                token: token
            }
        else 
            render json: {
                logged_in: false
            }
        end 
    end 

    def logout
        reset_session 
        render json: { status: 200, logged_out: true }
    end
end 