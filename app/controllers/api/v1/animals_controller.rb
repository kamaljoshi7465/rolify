module Api 
    module V1 

        class AnimalsController < ApplicationController
            before_action only: %i[ show edit update destroy ]
        
            def index
                render json: Animal.all 
            end
        
            def show
                render json: Animal.find(params[:id])
            end
        
            def new
                render json: Animal.new
            end
        
            def edit
            end
        
            def create
                @animal = Animal.new(animal_params)

                if @animal.save
                    render json: @animal, status: :created
                else
                    render json: @animal.errors, status: :unprocessable_entity
                end
            end
        
            def update
                @animal = Animal.find(params[:id])
                if @animal.update(animal_params)
                    render json: "Succesfully updated"
                else
                  render json: @animal.errors, status: :unprocessable_entity
                end
            end

            def destroy
                @animal = Animal.find(params[:id])
                @animal.destroy
                render json: "Succesfully deleted"
            end
        
            private

            def animal_params
                params.permit(:name, :color)
            end
        end
    end 
end