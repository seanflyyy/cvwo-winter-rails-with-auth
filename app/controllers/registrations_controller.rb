class RegistrationsController < ApplicationController 
    def create 
        begin
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
        rescue ActiveRecord::RecordInvalid => invalid
            render json: {error: invalid, status: 422}
            return
        end
    end

end 