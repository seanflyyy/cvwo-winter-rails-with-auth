class RegistrationsController < ApplicationController 
    def create 
        user = User.create!(
            email: params['user']['email'], 
            password: params['user']['password'],
            password_confirmation: params['user']['password_confirmation']
        )
     
        if user
            payload = {user_id: user.id}
            token = encode_token(payload)
            session[:user_id] = user.id
            render json: {
                status: :created,
                user: user,
                token: token
            }
        else 
            render json: {status: 500} # status 500 is an error
        end 
    end

end 