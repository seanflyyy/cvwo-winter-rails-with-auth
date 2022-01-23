class LabelsController < ApplicationController
    protect_from_forgery with: :null_session 

    def index 
        labels = Label.find_by(user_id: session[:user_id])

        render json: LabelSerializer.new(labels, options).serialized_json
    end 
    
    def show
        label = Label.find(params[:id])

        render json: LabelSerializer.new(label, options).serialized_json
    end 

    def create
        label = Label.new(label_params)

        if label.save 
            render json: LabelSerializer.new(label).serialized_json
        else 
            render json: {error: label.errors.messages }, status: 422
        end 
    end 

    def update
        label = Label.find(params[:id])

        if label.update(label_params) 
            render json: LabelSerializer.new(label, options).serialized_json
        else 
            render json: {error: label.errors.messages }, status: 422
        end 
    end 

    def destroy 
        label = Label.find(params[:id])

        if label.destroy 
            head :no_content
        else 
            render json: {error: label.errors.messages }, status: 422
        end 
    end 
    private 

    def label_params
        params.require(:label).permit(:title, :color, :user_id)
    end 

    def options 
        @options ||= { include: %i[tasks] }
    end 
end